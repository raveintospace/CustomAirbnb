//
//  UploadView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/2/24.
//

import SwiftUI

struct UploadView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    Image(systemName: "globe.americas")
                        .font(.system(size: 80))
                        .foregroundStyle(Color.theme.airRed)
                    Text("Where is your home?")
                        .font(.title)
                        .bold()
                    
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            DismissXButton()
                        }
                })
                }
            }
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
