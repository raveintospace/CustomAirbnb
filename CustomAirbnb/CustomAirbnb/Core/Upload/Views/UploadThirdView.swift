//
//  UploadThirdView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/2/24.
//

import SwiftUI

struct UploadThirdView: View {
    
    @ObservedObject var viewModel: UploadViewModel
    
    @State private var showPublishAlert: Bool = false
    @FocusState private var focusedField: FieldFocused?
    
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
                                .focused($focusedField, equals: .title)
                            DescriptionTextEditorView(descriptionText: $viewModel.description)
                                .focused($focusedField, equals: .description)
                            PriceHStack(price: $viewModel.price)
                                .focused($focusedField, equals: .price)
                            GuestsBedsHStack(guests: $viewModel.guestsText, beds: $viewModel.bedsText, focusedField: $focusedField)
                            RoomsHStack(bedrooms: $viewModel.bedroomsText, bathrooms: $viewModel.bathroomsText, focusedField: $focusedField)
                            continueButton
                        }
                    }
                }
            }
            .alert(isPresented: $showPublishAlert) {
                Alert(
                    title: Text("Submit your listing"),
                    message: Text("Your listing will be reviewed before becoming published"),
                    primaryButton: .default(Text("Submit")) {
                        viewModel.dismissUploadSheet.toggle()
                    },
                    secondaryButton: .cancel() {
                        showPublishAlert = false
                    }
                )
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
                        handleDoneButtonTapped()
                    }, label: {
                        Text("Done")
                            .foregroundStyle(Color.theme.accent)
                    })
                }
            }
            .onAppear {
                focusedField = .title // MARK: - TO DO: remove this modifier
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
            showPublishAlert = true
            // show a confirmation rectangle in homeview
        }
        .disabled(!viewModel.isContinueButtonThirdViewEnabled)
    }
    
    private func handleDoneButtonTapped() {
        UIApplication.shared.hideKeyboard()
        switch focusedField {
        case .title:
            if !viewModel.title.isEmpty {
                focusedField = .description
            }
        case .description:
            if !viewModel.description.isEmpty {
                focusedField = .price
            }
        case .price:
            if !viewModel.price.isEmpty {
                focusedField = .guests
            }
        case .guests:
            if !viewModel.guestsText.isEmpty {
                focusedField = .beds
            }
        case .beds:
            if !viewModel.bedsText.isEmpty {
                focusedField = .bedrooms
            }
        case .bedrooms:
            if !viewModel.bedroomsText.isEmpty {
                focusedField = .bathrooms
            }
        case .bathrooms:
            if !viewModel.bathroomsText.isEmpty {
                focusedField = nil
            }
        case .none:
            break
        }
    }
}
