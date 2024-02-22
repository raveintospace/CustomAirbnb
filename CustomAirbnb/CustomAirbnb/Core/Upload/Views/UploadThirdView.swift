//
//  UploadThirdView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/2/24.
//

import SwiftUI

struct UploadThirdView: View {
    
    @State private var listingTitle: String = ""
    @State private var strokeColor: Color = Color.theme.secondaryText.opacity(0.3)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    progressImage
                    PhotosPickerView()
                    titleTextField
                    Spacer()
                }
                .padding(.horizontal)
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
    
    private var titleTextField: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Listing title")
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                    .padding(.horizontal)
                    .padding(.top)
                
                TextField("",
                          text: $listingTitle,
                          onEditingChanged: { editing in
                    strokeColor = editing ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3)
                })
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accent)
                .padding(.horizontal)
                .padding(.bottom)
                .onChange(of: listingTitle) {
                    if listingTitle.count > 40 {
                        listingTitle = String(listingTitle.prefix(40))
                    }
                }
            }
            if !listingTitle.isEmpty {
                Button(action: {
                    listingTitle = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .font(.body)
                        .frame(width: 40)
                        .padding()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(strokeColor)
        )
        .onAppear {
            strokeColor = Color.theme.secondaryText.opacity(0.3)
        }
    }
}
