//
//  ContentView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var selectedListing: Listing? = nil
    @State private var showDetailView: Bool = false
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    homeHeader
                    SearchBarView(searchText: $viewModel.searchText)
                    apartmentsList
                }
            }
            .navigationDestination(isPresented: $showDetailView) {
                    DetailLoadingView(listing: $selectedListing)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(HomeViewModel())
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: "info.circle")
                .onTapGesture {
                    withAnimation(.spring()) {
                        debugPrint("create the show settings view!")
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showSettingsView)
                )
            Spacer()
            Text("Available listings")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var apartmentsList: some View {
        List {
            ForEach(viewModel.allListings) { listing in
                ListingRowView(listing: listing)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowSeparatorTint(Color.theme.airRed)
                    .onTapGesture {
                        segue(listing: listing)
                    }
            }
            .listRowBackground(Color.theme.background)
        }
        .listStyle(.plain)
    }
    
    private func segue(listing: Listing) {
        selectedListing = listing
        showDetailView.toggle()
    }
}
