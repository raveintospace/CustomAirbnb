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
                    Image(systemName: "globe.americas")
                        .font(.system(size: 80))
                        .foregroundStyle(Color.theme.airRed)
                    Text("Where is your home?")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.theme.accent)
                    
                    homePicker
                    Spacer()
                    ContinueButton
                }
                
                
                
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
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
}
