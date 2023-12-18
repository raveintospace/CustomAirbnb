//
//  ContentView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.allListings) { listing in
                Text(listing.name ?? "no name")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(HomeViewModel())
    }
}
