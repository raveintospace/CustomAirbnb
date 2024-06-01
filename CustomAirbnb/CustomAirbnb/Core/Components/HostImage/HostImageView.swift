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
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: circleSize, height: circleSize)
                    .clipShape(Circle())
            } else {
                let usePlaceholder = Bool.random()
                if usePlaceholder {
                    Image("hostPlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: circleSize, height: circleSize)
                        .clipShape(Circle())
                } else {
                    let assetImages = ["host1", "host2", "host3"]
                    let randomImageName = assetImages.randomElement() ?? "hostPlaceholder"
                    Image(randomImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: circleSize, height: circleSize)
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct HostImageView_Previews: PreviewProvider {
    static var previews: some View {
        HostImageView(listing: dev.listing)
    }
}
