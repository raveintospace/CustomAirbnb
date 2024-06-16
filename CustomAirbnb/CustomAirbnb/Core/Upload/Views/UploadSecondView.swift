//
//  UploadSecondView.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct UploadSecondView: View {
    
    @ObservedObject var viewModel: UploadViewModel
    
    @Binding var listingLocation: String
    
    @State private var showUploadThirdView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    progressImage
                    hoodText
                    
                    if let city = viewModel.cities.first(where: { $0.name == listingLocation }) {
                        List(city.hoods, id: \.self) { hood in
                            customHoodRow(hood: hood, selectedHood: $viewModel.selectedHood) {
                                viewModel.selectedHood = hood
                            }
                        }
                        .listStyle(.plain)
                    }
                    
                    continueButton
                }
                .navigationTitle("List your home")
                .navigationBarTitleDisplayMode(.inline)
                .scrollIndicators(.hidden)
                .toolbar() {
                    ToolbarItem(placement: .topBarLeading) {
                        TopBarLeadingArrow()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        .navigationDestination(isPresented: $showUploadThirdView) {
            UploadThirdView(viewModel: viewModel)
        }
    }
}

#Preview {
    UploadSecondView(viewModel: UploadViewModel(), listingLocation: .constant("Amsterdam"))
}

extension UploadSecondView {
    
    private var progressImage: some View {
        Image("prog2")
            .resizable()
            .scaledToFit()
            .frame(height: 25)
    }
    
    private var hoodText: some View {
        Text("Select your neighbourhood in \(listingLocation)")
            .font(.title2)
            .multilineTextAlignment(.center)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .padding(.horizontal)
    }
    
    private func customHoodRow(hood: String, selectedHood: Binding<String?>, onTap: @escaping () -> Void) -> some View {
        HStack {
            Text(hood)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            Image(systemName: selectedHood.wrappedValue == hood ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(Color.theme.airRed)
        }
        .font(.title3)
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            -20
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowBackground(Color.theme.background)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
    
    private var continueButton: some View {
        ContinueRedButton {
            showUploadThirdView.toggle()
        }
        .disabled(viewModel.selectedHood == nil ? true : false)
    }
}
