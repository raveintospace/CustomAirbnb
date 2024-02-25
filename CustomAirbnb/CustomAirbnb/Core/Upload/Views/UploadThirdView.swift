//
//  UploadThirdView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/2/24.
//

import SwiftUI

struct UploadThirdView: View {
    
    @StateObject var viewModel: UploadViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    progressImage
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            PhotosPickerView()
                            TitleTextFieldView(listingTitle: $viewModel.title)
                            DescriptionTextEditorView(descriptionText: $viewModel.description)
                            PriceHStack(price: $viewModel.price)
                            GuestsBedsHStack(guests: $viewModel.guestsText, beds: $viewModel.bedsText)
                            RoomsHStack(bedrooms: $viewModel.bedroomsText, bathrooms: $viewModel.bathroomsText)
                            continueButton
                        }
                    }
                }
            }
            .navigationTitle("List your home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .scrollIndicators(.hidden)
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    TopBarLeadingArrow()
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(action: {
                        UIApplication.shared.hideKeyboard()
                    }, label: {
                        Text("Done")
                            .foregroundStyle(Color.theme.accent)
                    })
                }
            }
        }
    }
}

#Preview {
    UploadThirdView(viewModel: UploadViewModel())
}

extension UploadThirdView {
    
    private var progressImage: some View {
        Image("prog3")
            .resizable()
            .scaledToFit()
            .frame(height: 25)
    }
    
    private var continueButton: some View {
        ContinueRedButton {
            debugPrint("continue button pressed")
            // dismiss
            // show alert to confirm the upload & announce a review
            // show a confirmation rectangle in homeview
        }
        .disabled(!viewModel.isContinueButtonThirdViewEnabled)
    }
}

/*
 TO DO
 When Continue button pressed: dismiss view and go back to home view with a confirmation message
 */
