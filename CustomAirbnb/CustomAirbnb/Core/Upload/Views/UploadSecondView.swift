//
//  UploadSecondView.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct UploadSecondView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                Text("Second view")
                
            }
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
    UploadSecondView()
}
