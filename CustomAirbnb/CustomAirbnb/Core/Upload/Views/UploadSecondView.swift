//
//  UploadSecondView.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct UploadSecondView: View {
    
    @Binding var listingLocation: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    // circle progress (image)
                    Spacer()
                    // image
                    hoodText
                    // picker
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
    UploadSecondView(listingLocation: .constant("Amsterdam"))
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
