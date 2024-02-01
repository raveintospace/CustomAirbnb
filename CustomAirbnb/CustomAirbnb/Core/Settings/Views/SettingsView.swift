//
//  SettingsView.swift
//  CustomAirbnb
//
//  Created by Uri on 1/2/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selection = "Barcelona"
    let cities = ["Amsterdam", "Barcelona", "London", "Los Angeles", "Melbourne"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    Picker("Select your destination", selection: $selection) {
                        ForEach(cities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .scaleEffect(1.2)
                    Spacer()
                }
                .navigationTitle("Select your destination")
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
    SettingsView()
}
