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
    
    var body: some View {
        NavigationStack {
            HStack() {
                Spacer()
                DismissXButton()
            }
            .padding(.horizontal)
            VStack {
                TabView {
                    ForEach(dummyImages, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}

#Preview {
    FullScreenImageView()
}
