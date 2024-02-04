//
//  SettingsView.swift
//  CustomAirbnb
//
//  Created by Uri on 1/2/24.
//

import SwiftUI

struct FiltersView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var guests: Int = 1
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    Slider(
                        value: .convert(from: $guests),
                        in: 1...10,
                        step: 1
                    )
                    
                }
                .navigationTitle("Filter listings")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        DismissXButton()
                    }
                })
            }
        }
    }
}

#Preview {
    FiltersView()
}
