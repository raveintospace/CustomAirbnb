//
//  XLImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/1/24.
//

import SwiftUI

struct XLImageView: View {
    
    @StateObject private var viewModel: XLImageViewModel
    
    @State private var sliderCurrentIndex: Int = 0
    @State private var showFullScreenImage: Bool = false
    @State private var isLoading: Bool = false
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: XLImageViewModel(listing: listing))
        setupTabViewAppearance()
    }
    
    var body: some View {
        
        if isLoading {
            loadingPicturesProgressView
            
        } else {
            if !viewModel.imagesForSlider.isEmpty {
                VStack {
                    xlPicturesSlider
                }
                .frameRectTenShape(height: 400)
                .fullScreenCover(isPresented: $showFullScreenImage) {
                    FullScreenImageView(listing: viewModel.listing, sliderCurrentIndex: $sliderCurrentIndex)
                }
            } else {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .opacity(0.75)
                        .frameRectTenShape(height: 400)
                }
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
    
    private var loadingPicturesProgressView: some View {
        ProgressView {
            Text("Loading pictures")
                .foregroundStyle(Color.theme.secondaryText)
                .bold()
        }
        .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.airRed))
        .controlSize(.large)
        .frameRectTenShape(height: 400)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                isLoading = false
            }
        }
    }
    
    private var xlPicturesSlider: some View {
        TabView(selection: $sliderCurrentIndex) {
            ForEach(0..<viewModel.imagesForSlider.count, id: \.self) { imageIndex in
                
                // convert images from array to use them in slider
                let imageType = viewModel.imagesForSlider[imageIndex]
                let image = imageType.image
                
                // GR sizes and positions the image based on its parent view
                GeometryReader { geometry in
                    image
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .tag(imageIndex)
                        .onTapGesture {
                            showFullScreenImage.toggle()
                        }
                }
                // set height 400 for all images
                .frame(height: 400)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}
