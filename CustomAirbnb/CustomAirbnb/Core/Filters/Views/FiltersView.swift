//
//  SettingsView.swift
//  CustomAirbnb
//
//  Created by Uri on 1/2/24.
//

import SwiftUI

struct FiltersView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var guests: Int = 1
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    Slider(
                        value: .convert(from: $viewModel.guestsFilter),
                        in: 1...10,
                        step: 1,
                        minimumValueLabel: Text("1"),
                        maximumValueLabel: Text("10"),
                        label: {
                            Text("Values")
                        }
                    )
                    Text("Guests: \(viewModel.guestsFilter)")
                    
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

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
            .environmentObject(HomeViewModel())
    }
}

/*
 Picker("Guests", selection: $viewModel.bedsFilter) {
     ForEach(0..<5) { number in
         Text("\(number)")
     }
 }
 .pickerStyle(.menu)
 */
