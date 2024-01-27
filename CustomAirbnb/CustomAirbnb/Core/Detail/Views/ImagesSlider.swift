//
//  ImagesSlider.swift
//  CustomAirbnb
//
//  Created by Uri on 25/12/23.
//

import SwiftUI

struct ImagesSlider: View {
    
    let listing: Listing
    
    let dummyImages = [
        "dummyPicSlider1",
        "dummyPicSlider2",
        "dummyPicSlider3",
        "dummyPicSlider4"
    ]
    
    @State private var sliderCurrentIndex: Int = 0
    @State private var showFullScreenImage: Bool = false
    
    init(listing: Listing) {
        self.listing = listing
        setupTabViewAppearance()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            dummySlider
            
            if let listingWebsite = listing.listingURL {
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundStyle(Color.theme.airRed)
                    HStack {
                        Image(systemName: "house")
                        Link("Listing Website", destination: URL(string: listingWebsite)!)
                            .bold()
                        Spacer()
                    }
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 15)
                }
            }
        }
        .fullScreenCover(isPresented: $showFullScreenImage) {
            FullScreenImageView(sliderCurrentIndex: $sliderCurrentIndex)
        }
    }
}

struct ImagesSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImagesSlider(listing: dev.listing)
    }
}

extension ImagesSlider {
    
    private var dummySlider: some View {
        VStack {
            TabView(selection: $sliderCurrentIndex) {
                ForEach(0..<dummyImages.count, id: \.self) { imageIndex in
                    Image(dummyImages[imageIndex])
                        .resizable()
                        .scaledToFill()
                        .tag(imageIndex)
                }
                .onTapGesture {
                    showFullScreenImage.toggle()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        }
        .frame(height: 400)
        .clipShape(
            .rect(
                topLeadingRadius: 10,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 10
            )
        )
    }
    
    private func setupTabViewAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red.withAlphaComponent(0.5)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.2)
    }
}

