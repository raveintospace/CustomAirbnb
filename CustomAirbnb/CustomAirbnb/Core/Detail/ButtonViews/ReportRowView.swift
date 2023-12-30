//
//  ReportRowView.swift
//  CustomAirbnb
//
//  Created by Uri on 30/12/23.
//

import SwiftUI

struct ReportRowView: View {
    
    let reason: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text("")    // -> necessary for RowSeparator to occupy the whole screen
            Image(systemName: "mustache.fill")
            Text("Joke")
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.theme.background)
    }
}

#Preview {
    ReportRowView(reason: "Joke", icon: "mustache.fill")
}
