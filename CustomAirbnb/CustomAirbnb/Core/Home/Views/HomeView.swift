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
    @State private var showFavoritesView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    homeHeader
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    if !showFavoritesView {
                        allApartmentsList
                            .transition(.move(edge: .leading))
                    }
                    if showFavoritesView {
                        ZStack(alignment: .top) {
                            if viewModel.favoriteListings.isEmpty && viewModel.searchText.isEmpty {
                                favoriteListEmptyView
                            } else {
                                favApartmentsList
                            }
                            
                        }
                        .transition(.move(edge: .trailing))
                    }
                    Spacer(minLength: 0) // avoids header to go down
                }
                .popover(isPresented: $showSettingsView) {
                    SettingsView()
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
            CircleButtonView(iconName: "gearshape")
                .foregroundStyle(showSettingsView ? Color.theme.airRed : Color.theme.accent)
                .onTapGesture {
                    withAnimation {
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showSettingsView)
                )
            Spacer()
            Text(showFavoritesView ? "Favorite listings" : "Available listings")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .transaction { transaction in
                    transaction.animation = nil
                }
            Spacer()
            CircleButtonView(iconName: showFavoritesView ? "heart.fill" : "heart")
                .foregroundStyle(showFavoritesView ? Color.theme.airRed : Color.theme.accent)
                .onTapGesture {
                    withAnimation {
                        showFavoritesView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showFavoritesView)
                )
        }
        .padding(.horizontal)
    }
    
    private var allApartmentsList: some View {
        List {
            ForEach(viewModel.allListings) { listing in
                ListingRowView(listing: listing)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowSeparatorTint(Color.theme.airRed)
                    .onTapGesture {
                        segue(listing: listing)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.updateFavorites(listing: listing)
                        }, label: {
                            if !viewModel.setDesignForHeartFav(listing: listing) {
                                Label("Favorite", systemImage: "heart.fill")
                            }
                            else {
                                Label("Unfavorite", systemImage: "heart.slash")
                            }
                        })
                        .tint(Color.theme.airRed)
                    }
            }
            .listRowBackground(Color.theme.background)
        }
        .listStyle(.plain)
    }
    
    private var favApartmentsList: some View {
        List {
            ForEach(viewModel.favoriteListings) { listing in
                ListingRowView(listing: listing)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowSeparatorTint(Color.theme.airRed)
                    .onTapGesture {
                        segue(listing: listing)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.updateFavorites(listing: listing)
                        }, label: {
                            Label("Unfavorite", systemImage: "heart.slash")
                        })
                        .tint(Color.theme.airRed)
                    }
            }
            .listRowBackground(Color.theme.background)
        }
        .listStyle(.plain)
    }
    
    private var favoriteListEmptyView: some View {
        VStack(spacing: 30) {
            Image(systemName: "heart.slash")
                .font(.system(size: 40))
                .foregroundStyle(Color.theme.secondaryText.opacity(0.3))
            Text("No favorites")
                .font(.system(size: 40))
                .bold()
            Text("You haven't tagged any listing as favorite. Swipe left on the listing you want to favorite or press the ❤️ button when checking its details.")
                .font(.callout)
        }
        .foregroundColor(Color.theme.accent)
        .multilineTextAlignment(.center)
        .padding(50)
    }
    
    private func segue(listing: Listing) {
        selectedListing = listing
        showDetailView.toggle()
    }
}
