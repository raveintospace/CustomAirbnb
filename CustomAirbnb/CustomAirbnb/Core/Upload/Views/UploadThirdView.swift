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
    @State private var guestsText: String = ""
    @State private var bedsText: String = ""
    @State private var bedroomsText: String = ""
    @State private var bathroomsText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Color.theme.background
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        progressImage
                        PhotosPickerView()
                        TitleTextFieldView(listingTitle: $title)
                        DescriptionTextEditorView(descriptionText: $description)
                        PriceHStack(price: $price)
                        GuestsBedsHStack(guests: $guestsText, beds: $bedsText)
                        RoomsHStack(bedrooms: $bedroomsText, bathrooms: $bathroomsText)
                        //continue button
                        Spacer()
                    }
                }
            }
            .navigationTitle("List your home")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
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
 Fix priceHstack
 keyboard with enter to submit (crypto currency!)
 */
