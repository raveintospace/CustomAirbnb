//
//  ContentView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    
    enum Sheet: String, Identifiable {
        case infoView, uploadView
        var id: String { rawValue }
    }
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @State private var selectedListing: Listing? = nil
    
    @State private var destination: String = "Barcelona"
    
    @State private var sheet: Sheet?
    @State private var showDetailView: Bool = false
    @State private var showFavoritesView: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(item: $sheet, content: makeSheet)
                    .sheet(isPresented: $viewModel.showFiltersView) {
                            FiltersView()
                    }
                
                VStack {
                    homeHeader
                    SearchBarView(searchText: $viewModel.searchText)
                    FiltersRowView()
                    
                    if isLoading {
                        loadingListingsProgressView
                        
                    } else {
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
                    }
                    Spacer(minLength: 0) // avoids header to go down
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
            CircleButtonView(iconName: showFavoritesView ? "info" : "plus")
                .transaction { transaction in
                    transaction.animation = nil
                }
                .onTapGesture {
                    if showFavoritesView {
                        sheet = .infoView
                    } else {
                        sheet = .uploadView
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showFavoritesView)
                )
            Spacer()
            
            VStack(spacing: 0) {
                destinationPicker
                    
                Text(showFavoritesView ? "Favorite listings" : "Available listings")
                    .font(.headline)
                    .foregroundStyle(Color.theme.accent)
                    .transaction { transaction in
                        transaction.animation = nil
                    }
            }
            Spacer()
            
            CircleButtonView(iconName: showFavoritesView ? "heart.fill" : "heart")
                .foregroundStyle(showFavoritesView ? Color.theme.airRed : Color.theme.accent)
                .onTapGesture {
                    withAnimation {
                        showFavoritesView.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allApartmentsList: some View {
        List {
            ForEach(viewModel.allListings) { listing in
                ListingRowView(listing: listing)
                    .listRowInsets(.init(top: 3, leading: 0, bottom: 3, trailing: 10))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in
                                0
                            }
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
                    .listRowInsets(.init(top: 3, leading: 0, bottom: 3, trailing: 10))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in
                                0
                            }
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
            Text("You haven't tagged any listing as favorite for this destination. Swipe left on the listing you want to favorite or press the ❤️ button when checking its details.")
                .font(.callout)
        }
        .foregroundColor(Color.theme.accent)
        .multilineTextAlignment(.center)
        .padding(50)
    }
    
    private var loadingListingsProgressView: some View {
        ProgressView {
            Text("Loading listings")
                .foregroundStyle(Color.theme.secondaryText)
                .bold()
        }
        .controlSize(.large)
        .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.airRed))
    }
    
    private var destinationPicker: some View {
        Picker("Select your destination", selection: $destination) {
            ForEach(viewModel.cities) { city in
                Text(city.name)
                    .tag(city.name)
                    .onChange(of: destination) { newValue in
                        viewModel.destination = destination
                        isLoading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isLoading = false
                        }
                    }
            }
        }
        .pickerStyle(.menu)
        .tint(Color.theme.airRed)
        .scaleEffect(1.2)
    }
    
    private func segue(listing: Listing) {
        selectedListing = listing
        showDetailView.toggle()
    }
    
    @ViewBuilder
    func makeSheet(_ sheet: Sheet) -> some View {
        switch sheet {
        case .infoView:
            InfoView()
        case .uploadView:
            UploadFirstView()
        }
    }
}
