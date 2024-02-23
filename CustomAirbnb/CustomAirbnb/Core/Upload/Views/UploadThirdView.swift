//
//  UploadThirdView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/2/24.
//

import SwiftUI

struct UploadThirdView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    progressImage
                    PhotosPickerView()
                    TitleTextFieldView(listingTitle: $title)
                    DescriptionTextEditorView(descriptionText: $description)
                    PriceHStack(price: $price)
                    Spacer()
                }
            }
            .navigationTitle("List your home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    TopBarLeadingArrow()
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    UploadThirdView()
}

extension UploadThirdView {
    
    private var progressImage: some View {
        Image("prog3")
            .resizable()
            .scaledToFit()
            .frame(height: 25)
    }
}

/*
 TO DO
 When Continue button pressed: validate that "integers" are not 0 or negative numbers -> method in VM & user convert string to int
 Scroll hides navigation title
 keyboard with enter to submit (crypto currency!)
 */
