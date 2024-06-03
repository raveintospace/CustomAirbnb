//
//  HostImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/12/23.
//

import SwiftUI

struct HostImageView: View {
    
    @StateObject var viewModel: HostImageViewModel
    let circleSize: CGFloat = 65
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: HostImageViewModel(listing: listing))
    }
    
    var body: some View {
        ZStack {
            renderHostImage()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: circleSize, height: circleSize)
                .clipShape(Circle())
        }
    }
}

struct HostImageView_Previews: PreviewProvider {
    static var previews: some View {
        HostImageView(listing: dev.listing)
    }
}

extension HostImageView {
    
    private func renderHostImage() -> Image {
        if let image = viewModel.image {
            return Image(uiImage: image)
        } else {
            let usePlaceholder = Int.random(in: 0..<4) == 0 // 1 out of 4 times
            if usePlaceholder {
                return Image("hostPlaceholder")
            } else {
                let assetImages = ["host1", "host2", "host3"]
                let randomImageName = assetImages.randomElement() ?? "hostPlaceholder"
                return Image(randomImageName)
            }
        }
    }
}
