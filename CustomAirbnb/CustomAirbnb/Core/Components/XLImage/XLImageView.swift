//
//  XLImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/1/24.
//

import SwiftUI

struct XLImageView: View {
    
    @StateObject var viewModel: XLImageViewModel
    
    @State private var sliderCurrentIndex: Int = 0
    @State private var showFullScreenImage: Bool = false
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: XLImageViewModel(listing: listing))
        setupTabViewAppearance()
    }
    
    var body: some View {
        if !viewModel.imagesForSlider.isEmpty {
            VStack {
                xlPicturesSlider
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
            .fullScreenCover(isPresented: $showFullScreenImage) {
                FullScreenImageView(listing: viewModel.listing, sliderCurrentIndex: $sliderCurrentIndex)
            }
        }
        
        else {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
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
    }
}

struct XLImageView_Previews: PreviewProvider {
    static var previews: some View {
        XLImageView(listing: dev.listing)
    }
}

extension XLImageView {
    
    private func setupTabViewAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red.withAlphaComponent(0.5)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.2)
    }
    
    private var xlPicturesSlider: some View {
        TabView(selection: $sliderCurrentIndex) {
            ForEach(0..<viewModel.imagesForSlider.count, id: \.self) { imageIndex in
                
                // convert images from array to use them in slider
                let imageType = viewModel.imagesForSlider[imageIndex]
                let image = imageType.image
                
                image
                    .scaledToFill()
                    .aspectRatio(imageType.aspectRatio, contentMode: .fill)
                    .tag(imageIndex)
                    .onTapGesture {
                        showFullScreenImage.toggle()
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}
