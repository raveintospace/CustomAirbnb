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
    @FocusState private var guestsFieldFocused: Bool
    
    @State private var bedsText: String = ""
    @FocusState private var bedsFieldFocused: Bool
    
    @State private var bedroomsText: String = ""
    @FocusState private var bedroomsFieldFocused: Bool
    
    @State private var bathroomsText: String = ""
    @FocusState private var bathroomsFieldFocused: Bool
    
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
                        listingIntegerVStack
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
    
    private var listingIntegerVStack: some View {
        VStack(spacing: 20) {
            HStack() {
                ListingIntegerTextField(inputText: $guestsText, fieldText: "Guests").focused($guestsFieldFocused)
                ListingIntegerTextField(inputText: $bedsText, fieldText: "Beds").focused($bedsFieldFocused)
            }
            HStack() {
                ListingIntegerTextField(inputText: $bedroomsText, fieldText: "Bedrooms").focused($bedroomsFieldFocused)
                ListingIntegerTextField(inputText: $bathroomsText, fieldText: "Bathrooms").focused($bathroomsFieldFocused)
            }
        }
    }
}

/*
 TO DO
 When Continue button pressed: validate that "integers" are not 0 or negative numbers -> method in VM & user convert string to int
 Fix priceHstack
 keyboard with enter to submit (crypto currency!)
 */
