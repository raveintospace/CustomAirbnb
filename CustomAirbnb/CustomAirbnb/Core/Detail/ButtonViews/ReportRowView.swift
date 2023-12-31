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
        HStack() {
            Text("")    // -> necessary for RowSeparator to occupy the whole screen
            Image(systemName: icon)
            Text(reason)
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.theme.background)
    }
}

#Preview {
    VStack(alignment: .leading) {
        ReportRowView(reason: "Joke", icon: "mustache.fill")
        ReportRowView(reason: "Spam", icon: "s.circle.fill")
        ReportRowView(reason: "Doubled listing", icon: "repeat.1.circle.fill")
        ReportRowView(reason: "Explicit content", icon: "eye.trianglebadge.exclamationmark.fill")
        ReportRowView(reason: "Photos don't match", icon: "camera.fill")
        ReportRowView(reason: "Forbidden content or service", icon: "xmark.seal.fill")
    }
}
