//
//  ContentView.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color.theme.accent)
            Rectangle()
                .foregroundColor(Color.theme.background)
            Rectangle()
                .foregroundColor(Color.theme.secondaryText)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
