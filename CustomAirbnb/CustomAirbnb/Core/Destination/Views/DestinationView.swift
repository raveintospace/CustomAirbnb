//
//  SettingsView.swift
//  CustomAirbnb
//
//  Created by Uri on 1/2/24.
//

import SwiftUI

struct DestinationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var destination: String
    let cities = ["Amsterdam", "Barcelona", "London", "Los Angeles", "Melbourne", "Paris", "Roma", "San Diego", "Toronto"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    Picker("Select your destination", selection: $destination) {
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
    DestinationView(destination: .constant("Barcelona"))
}
