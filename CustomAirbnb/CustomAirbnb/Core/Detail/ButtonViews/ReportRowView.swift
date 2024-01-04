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
            Text("") // separator occupies all width
            Image(systemName: icon)
                .frame(width: 30)
            Text(reason)  
            Spacer()
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowBackground(Color.theme.background)
        .listRowInsets(EdgeInsets())
        .background(Color.theme.background.opacity(0.001))
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
