//
//  FullScreenImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 26/1/24.
//

import SwiftUI

struct FullScreenImageView: View {
    
    @StateObject var viewModel: XLImageViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var sliderCurrentIndex: Int
    
    init(listing: Listing, sliderCurrentIndex: Binding<Int>) {
        _viewModel = StateObject(wrappedValue: XLImageViewModel(listing: listing))
        _sliderCurrentIndex = sliderCurrentIndex
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    TabView(selection: $sliderCurrentIndex) {
                        ForEach(0..<viewModel.imagesForSlider.count, id: \.self) { imageIndex in
                            
                            // convert images from array to use them in slider
                            let imageType = viewModel.imagesForSlider[imageIndex]
                            let image = imageType.image
                            
                            image
                                .scaledToFit()
                                .aspectRatio(imageType.aspectRatio, contentMode: .fit)
                                .tag(imageIndex)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        DismissXButton()
                    }
                })
            }
        }
    }
}

struct FullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImageView(listing: dev.listing, sliderCurrentIndex: .constant(1))
    }
}
