//
//  UploadView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/2/24.
//

import SwiftUI

struct UploadFirstView: View {
    
    @StateObject private var viewModel: UploadViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var currentImageIndex = 0
    @State private var listingLocation: String = "Amsterdam"
    @State private var showUploadSecondView: Bool = false
    
    init() {
        _viewModel = StateObject(wrappedValue: UploadViewModel())
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    progressImage
                    Spacer()
                    globeImages
                    homeText
                    homePicker
                    Spacer()
                    continueButton
                }
                .navigationTitle("List your home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        DismissXButton()
                    }
                })
            }
            .navigationDestination(isPresented: $showUploadSecondView) {
                UploadSecondView(viewModel: viewModel, listingLocation: $listingLocation)
            }
            .onReceive(viewModel.$dismissUploadSheet) { shouldDismissSheet in
                if shouldDismissSheet {
                    dismiss()
                    homeViewModel.showUploadThanks = true
                }
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
    
    private var progressImage: some View {
        Image("prog1")
            .resizable()
            .scaledToFit()
            .frame(height: 25)
    }
    
    private var globeImages: some View {
        Image(systemName: viewModel.globeImages[currentImageIndex])
            .font(.system(size: 80, weight: .light))
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
    
    private var continueButton: some View {
        ContinueRedButton {
            showUploadSecondView.toggle()
        }
    }
}
