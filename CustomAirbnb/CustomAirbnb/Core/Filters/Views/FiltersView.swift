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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    guestsFilter
                    bedsFilter
                    bedroomsFilter
                    bathroomsFilter
                }
                .padding(.horizontal, 25)
                .navigationTitle("Filter listings")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        DismissXButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        navigationBarResetButton
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

extension FiltersView {
    
    private var navigationBarResetButton: some View {
        Button(action: {
            viewModel.resetFiltersValues()
        }, label: {
            VStack(spacing: 0) {
                Text("Reset")
                Text("filters")
            }
            .font(.headline)
        })
        .tint(Color.theme.airRed).opacity(0.8)
    }
    
    private var guestsFilter: some View {
        VStack {
            HStack {
                Image(systemName: "figure.stand")
                Text("Guests: \(viewModel.guestsFilter)")
                    .font(.title3)
                    .foregroundStyle(Color.theme.accent)
            }
            Slider(
                value: .convert(from: $viewModel.guestsFilter),
                in: 1...20,
                step: 1,
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("20"),
                label: {
                    Text("Values")
                }
            )
            .tint(Color.theme.airRed)
        }
    }
    
    private var bedsFilter: some View {
        VStack(spacing: 5) {
            HStack {
                Image(systemName: "bed.double.fill")
                Text("Beds: \(viewModel.bedsFilter)")
                    .font(.title3)
                    .foregroundStyle(Color.theme.accent)
            }
            Slider(
                value: .convert(from: $viewModel.bedsFilter),
                in: 1...20,
                step: 1,
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("20"),
                label: {
                    Text("Values")
                }
            )
            .tint(Color.theme.airRed)
        }
    }
    
    private var bedroomsFilter: some View {
        VStack {
            HStack {
                Image(systemName: "door.left.hand.closed")
                Text("Bedrooms: \(viewModel.bedroomsFilter)")
                    .font(.title3)
                    .foregroundStyle(Color.theme.accent)
            }
            Slider(
                value: .convert(from: $viewModel.bedroomsFilter),
                in: 1...20,
                step: 1,
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("20"),
                label: {
                    Text("Values")
                }
            )
            .tint(Color.theme.airRed)
        }
    }
    
    private var bathroomsFilter: some View {
        VStack {
            HStack() {
                Image(systemName: "toilet")
                Text("Bathrooms: \(viewModel.bathroomsFilter.asNumberStringRounded())")
            }
            .font(.title3)
            .foregroundStyle(Color.theme.accent)
            
            Slider(
                value: $viewModel.bathroomsFilter,
                in: 1...20,
                step: 1,
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("20"),
                label: {
                    Text("Values")
                }
            )
            .tint(Color.theme.airRed)
        }
    }
}
