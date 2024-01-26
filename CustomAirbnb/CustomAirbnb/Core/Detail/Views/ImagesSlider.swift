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
    
    @State private var showFullScreenImage: Bool = false
    
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
        .fullScreenCover(isPresented: $showFullScreenImage, content: FullScreenImageView.init)
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
            TabView {
                ForEach(dummyImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
                .onTapGesture {
                    showFullScreenImage.toggle()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
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
    
    private var dummyRectangle: some View {
        Rectangle()
            .foregroundStyle(Color.yellow)
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
}

// scale to fill i on tap, scale to fit
