//
//  UploadSecondView.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct UploadSecondView: View {
    
    @StateObject var viewModel: UploadViewModel
    
    @Binding var listingLocation: String
    
    @State private var selectedHood: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    // circle progress (canva)
                    Spacer()
                    // image
                    hoodText
                    
                    if let city = viewModel.cities.first(where: { $0.name == listingLocation }) {
                        List(city.hoods, id: \.self) { hood in
                            HStack {
                                Text(hood)
                                    .foregroundStyle(Color.theme.accent)
                                Spacer()
                                Image(systemName: selectedHood == hood ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(Color.theme.airRed)
                            }
                            .alignmentGuide(.listRowSeparatorLeading) { _ in
                                -20
                            }
                            .listRowSeparatorTint(Color.theme.airRed)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedHood = hood
                            }
                        }
                        .listStyle(.plain)
                    }
                    Spacer()
                    continueButton
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
    UploadSecondView(viewModel: UploadViewModel(), listingLocation: .constant("Amsterdam"))
}

extension UploadSecondView {
    
    private var hoodText: some View {
        Text("Select your neighbourhood in \(listingLocation)")
            .font(.title2)
            .multilineTextAlignment(.center)
            .bold()
            .foregroundStyle(Color.theme.accent)
    }
    
    private var continueButton: some View {
        ContinueRedButton {
            debugPrint("go to third")
        }
    }
}

// MARK: - TO DO
/*
 red divider
 continue disabled without a hood selected
 extract views to extension
 */
