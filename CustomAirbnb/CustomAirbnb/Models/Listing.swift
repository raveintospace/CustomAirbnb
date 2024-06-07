//
//  Listing.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import Foundation

// old response
/*
 
 URL:
 https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=20&refine=room_type%3A%22Entire%20home%2Fapt%22&refine=city%3A%22Barcelona%22
 
 JSON Response:
 
 // MARK: - Listing
 struct Listing {
     let id: String?
     let listingURL: String?
     let scrapeID, lastScraped, name, summary: String?
     let space, description, experiencesOffered, neighborhoodOverview: String?
     let notes: NSNull?
     let transit, access, interaction, houseRules: String?
     let thumbnailURL, mediumURL: String?
     let pictureURL: PictureURL?
     let xlPictureURL: String?
     let hostID: String?
     let hostURL: String?
     let hostName, hostSince, hostLocation, hostAbout: String?
     let hostResponseTime, hostResponseRate, hostAcceptanceRate: NSNull?
     let hostThumbnailURL, hostPictureURL: String?
     let hostNeighbourhood: NSNull?
     let hostListingsCount, hostTotalListingsCount: Int?
     let hostVerifications: [String]?
     let street: String?
     let neighbourhood: NSNull?
     let neighbourhoodCleansed, neighbourhoodGroupCleansed, city, state: String?
     let zipcode, market, smartLocation, countryCode: String?
     let country, latitude, longitude, propertyType: String?
     let roomType: String?
     let accommodates, bathrooms, bedrooms, beds: Int?
     let bedType: String?
     let amenities: [String]?
     let squareFeet: NSNull?
     let price: Int?
     let weeklyPrice, monthlyPrice: NSNull?
     let securityDeposit, cleaningFee, guestsIncluded, extraPeople: Int?
     let minimumNights, maximumNights: Int?
     let calendarUpdated: String?
     let hasAvailability: NSNull?
     let availability30, availability60, availability90, availability365: Int?
     let calendarLastScraped: String?
     let numberOfReviews: Int?
     let firstReview, lastReview: String?
     let reviewScoresRating, reviewScoresAccuracy, reviewScoresCleanliness, reviewScoresCheckin: Int?
     let reviewScoresCommunication, reviewScoresLocation, reviewScoresValue: Int?
     let license, jurisdictionNames: NSNull?
     let cancellationPolicy: String?
     let calculatedHostListingsCount: Int?
     let reviewsPerMonth: Double?
     let geolocation: Geolocation?
     let features: [String]?
 }

 // MARK: - Geolocation
 struct Geolocation {
     let lon, lat: Double?
 }

 // MARK: - PictureURL
 struct PictureURL {
     let thumbnail: Bool?
     let filename, format: String?
     let width: Int?
     let mimetype, etag, id, lastSynchronized: String?
     let colorSummary: [String]?
     let height: Int?
     let url: String?
 }
 
 */

// new response
/*
 
 url: https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/air-bnb-listings/records?limit=40&refine=room_type%3A%22Entire%20home%2Fapt%22&refine=city%3A%22Paris%22
 
 
 "id": 11112336,
       "name": "Gótico, Las Ramblas (Cheaper for months!!)",
       "host_id": 51838891,
       "neighbourhood": "el Barri Gòtic",
       "room_type": "Entire home/apt",
       "column_10": 50,
       "minimum_nights": 31,
       "number_of_reviews": 17,
       "last_review": "2019-02-26",
       "reviews_per_month": 0.33,
       "calculated_host_listings_count": 2,
       "availability_365": 153,
       "updated_date": "2020-06-13",
       "city": "Barcelona",
       "column_19": "Spain",
       "coordinates": {
         "lon": 2.17432366342202,
         "lat": 41.3821572837473
       },
       "column_20": "Spain, Barcelona, el Barri Gòtic"
 */

struct Listing: Codable, Identifiable {
    
    // Listing details
    let id: String
    let listingURL: String?
    let name: String?
    let city: String?
    let description: String?
    let mediumURL: String?
    let xlPictureURL: String?
    let neighbourhood: String?
    let price: Int?
    
    // Listing grid
    let guests: Int
    let bathrooms: Double
    let bedrooms: Int
    let beds: Int
    
    // Host details
    let hostName: String?
    let hostThumbnailURL: String?
    let hostListingsCount: Int
    let numberOfReviews: Int?
    let reviewScoresRating: Int?
    
    // Computed property to determine the asset image name
    var assetImageName: String {
        return Listing.getAssetImageName(for: id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, city, description, neighbourhood, price, bathrooms, bedrooms, beds
        case listingURL = "listing_url"
        case mediumURL = "medium_url"
        case xlPictureURL = "xl_picture_url"
        case guests = "accommodates"
        case hostName = "host_name"
        case hostThumbnailURL = "host_thumbnail_url"
        case hostListingsCount = "calculated_host_listings_count"
        case numberOfReviews = "number_of_reviews"
        case reviewScoresRating = "review_scores_rating"
    }
    
    // Custom init for decoding the json
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // fix for id, was a String in old json, now an Int in new json
        let idInt = try container.decode(Int.self, forKey: .id)
        let id = String(idInt)
        
        let listingURL = try? container.decode(String.self, forKey: .listingURL)
        let name = try? container.decode(String.self, forKey: .name)
        let city = try? container.decode(String.self, forKey: .city)
        
        let description: String
        if let decodedDescription = try? container.decode(String.self, forKey: .description) {
            description = decodedDescription
        } else if let city = city, let cityDescriptions = NewApiStubs.sampleDescriptions[city] {
            description = cityDescriptions.randomElement()!
        } else {
            description = "A comfortable place to stay."
        }
        
        let decodedMediumURL = (try? container.decode(String.self, forKey: .mediumURL)) ?? ""
        let mediumURL = decodedMediumURL.isEmpty ? Listing.getAssetImageName(for: id) : decodedMediumURL
        
        let decodedXlPictureURL = (try? container.decode(String.self, forKey: .xlPictureURL)) ?? ""
        let xlPictureURL = decodedXlPictureURL.isEmpty ? Listing.getAssetImageName(for: id) : decodedXlPictureURL
        
        let neighbourhood = try? container.decode(String.self, forKey: .neighbourhood)
        let price = (try? container.decode(Int.self, forKey: .price)) ?? Int.random(in: 50...500)
        
        let guests = (try? container.decode(Int.self, forKey: .guests)) ?? Int.random(in: 1...10)
        let bathrooms = (try? container.decode(Double.self, forKey: .bathrooms)) ?? Double.random(in: 1...5)
        let bedrooms = (try? container.decode(Int.self, forKey: .bedrooms)) ?? Int.random(in: 1...8)
        let beds = (try? container.decode(Int.self, forKey: .beds)) ?? Int.random(in: 1...10)
        
        let hostName = (try? container.decode(String.self, forKey: .hostName)) ?? NewApiStubs.sampleHostNames.randomElement()!
        let hostThumbnailURL = try? container.decode(String.self, forKey: .hostThumbnailURL)
        let hostListingsCount = (try? container.decode(Int.self, forKey: .hostListingsCount)) ?? Int.random(in: 1...20)
        let numberOfReviews = try? container.decode(Int.self, forKey: .numberOfReviews)
        let reviewScoresRating = (try? container.decode(Int.self, forKey: .reviewScoresRating)) ?? Int.random(in: 10...100)
        
        self.init(
            id: id,
            listingURL: listingURL,
            name: name,
            description: description,
            mediumURL: mediumURL,
            xlPictureURL: xlPictureURL,
            neighbourhood: neighbourhood,
            price: price,
            guests: guests,
            bathrooms: bathrooms,
            bedrooms: bedrooms,
            beds: beds,
            hostName: hostName,
            hostThumbnailURL: hostThumbnailURL,
            hostListingsCount: hostListingsCount,
            numberOfReviews: numberOfReviews,
            reviewScoresRating: reviewScoresRating
        )
    }
    
    // MARK: - Convenience init for creating instances directly, such as PreviewProvider
    init(
        id: String,
        listingURL: String? = nil,
        name: String? = nil,
        city: String? = nil,
        description: String? = nil,
        mediumURL: String? = nil,
        xlPictureURL: String? = nil,
        neighbourhood: String? = nil,
        price: Int = Int.random(in: 50...500),
        guests: Int = Int.random(in: 1...10),
        bathrooms: Double = Double.random(in: 1...10),
        bedrooms: Int = Int.random(in: 1...10),
        beds: Int = Int.random(in: 1...10),
        hostName: String? = nil,
        hostThumbnailURL: String? = nil,
        hostListingsCount: Int = Int.random(in: 1...20),
        numberOfReviews: Int? = nil,
        reviewScoresRating: Int? = Int.random(in: 10...100)
    ) {
        self.id = id
        self.listingURL = listingURL
        self.name = name
        self.city = city
        self.description = description
        self.mediumURL = mediumURL
        self.xlPictureURL = xlPictureURL
        self.neighbourhood = neighbourhood
        self.price = price
        self.guests = guests
        self.bathrooms = bathrooms
        self.bedrooms = bedrooms
        self.beds = beds
        self.hostName = hostName
        self.hostThumbnailURL = hostThumbnailURL
        self.hostListingsCount = hostListingsCount
        self.numberOfReviews = numberOfReviews
        self.reviewScoresRating = reviewScoresRating
    }
    
    // MARK: - Calculated property to get star width
    var starsWidth: Double {
        if let score = reviewScoresRating {
            return (Double(score) / Double(20))
        } else {
            return 0
        }
    }
    
    // MARK: - Convenience properties for filter
    var nameToSearch: String { name ?? "" }
    var descriptionToSearch: String { description ?? "" }
    var hoodToSearch: String { neighbourhood ?? "" }
    var priceToSearch: Int { price ?? 0 }
    
    // Static method to get the asset image name
    static func getAssetImageName(for id: String) -> String {
        let assetImages = ["midlist1", "midlist2", "midlist3", "midlist4", "midlist5", "midlist6", "midlist7", "midlist8"]
        let assetImageIndex = (id.hashValue % assetImages.count)
        return assetImages[assetImageIndex]
    }
}
