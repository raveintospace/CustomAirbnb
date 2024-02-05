//
//  UploadView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/2/24.
//

import SwiftUI

struct UploadFirstView: View {
    
    @StateObject private var viewModel: UploadViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var currentImageIndex = 0
    @State private var listingLocation: String = "Amsterdam"
    
    init() {
        _viewModel = StateObject(wrappedValue: UploadViewModel())
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    Spacer()
                    globeImages
                    homeText
                    homePicker
                    Spacer()
                    ContinueButton
                }
                .navigationTitle("List your home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        DismissXButton()
                    }
                })
            }
        }
    }
}


struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadFirstView()
    }
}

extension UploadFirstView {
    
    private var globeImages: some View {
        Image(systemName: viewModel.globeImages[currentImageIndex])
            .font(.system(size: 80))
            .foregroundStyle(Color.theme.airRed)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    updateGlobeImage()
                }
            }
    }
    
    func updateGlobeImage() {
        currentImageIndex = (currentImageIndex + 1) % viewModel.globeImages.count
    }
    
    private var homeText: some View {
        Text("Where is your home?")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
    }
    
    private var homePicker: some View {
        Picker("Select where your home is", selection: $listingLocation) {
            ForEach(viewModel.cities) { city in
                Text(city.name)
                    .tag(city.name)
            }
        }
        .pickerStyle(.menu)
        .tint(Color.theme.airRed)
        .scaleEffect(1.2)
    }

    private var ContinueButton: some View {
        Button(action: {
            debugPrint("move to uploadsecondview")
        }, label: {
            Text("Continue")
            .foregroundStyle(Color.white)
            .bold()
            .frame(maxWidth: .infinity)
            .frame(height: 30)
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
        .padding(.horizontal, 30)
    }
}
