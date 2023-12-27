//
//  HostImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/12/23.
//

import SwiftUI

struct HostImageView: View {
    
    @StateObject var viewModel: HostImageViewModel
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: HostImageViewModel(listing: listing))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } else {
                Image("hostPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            }
        }
    }
}

struct HostImageView_Previews: PreviewProvider {
    static var previews: some View {
        HostImageView(listing: dev.listing)
    }
}
