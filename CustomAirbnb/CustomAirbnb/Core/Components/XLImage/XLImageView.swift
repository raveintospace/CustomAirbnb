//
//  XLImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/1/24.
//

import SwiftUI

struct XLImageView: View {
    @StateObject var viewModel: XLImageViewModel
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: XLImageViewModel(listing: listing))
    }
    
    var dummyImagesForSlider: [Image] = [
        Image("dummyPicSlider1"),
        Image("dummyPicSlider2"),
        Image("dummyPicSlider3"),
        Image("dummyPicSlider4")
    ]
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            } else {
                Image("airlogo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
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

}
