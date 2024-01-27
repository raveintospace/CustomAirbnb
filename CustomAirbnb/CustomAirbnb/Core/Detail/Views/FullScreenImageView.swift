//
//  FullScreenImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 26/1/24.
//

import SwiftUI

struct FullScreenImageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let dummyImages = [
        "dummyPicSlider1",
        "dummyPicSlider2",
        "dummyPicSlider3",
        "dummyPicSlider4"
    ]
    
    @Binding var sliderCurrentIndex: Int
    
    var body: some View {
        NavigationStack {
            HStack() {
                Spacer()
                DismissXButton()
            }
            .padding(.horizontal)
            VStack {
                TabView(selection: $sliderCurrentIndex) {
                    ForEach(0..<dummyImages.count, id: \.self) { imageIndex in
                        Image(dummyImages[imageIndex])
                            .resizable()
                            .scaledToFit()
                            .tag(imageIndex)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            }
        }
    }
}

#Preview {
    FullScreenImageView(sliderCurrentIndex: .constant(2))
}
