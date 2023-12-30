//
//  ReportView.swift
//  CustomAirbnb
//
//  Created by Uri on 30/12/23.
//

import SwiftUI

struct ReportView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                jokeReason
                jokeReason
            }
            .padding(.top, 5)
            .listStyle(.plain)
            
            .background(
                Color.theme.background
                    .ignoresSafeArea()
            )
            .navigationTitle("Report listing")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            })
        }
    }
}

#Preview {
    ReportView()
}

extension ReportView {
    
    private var jokeReason: some View {
        HStack(spacing: 15) {
            Text("")    // -> necessary for RowSeparator to occupy the whole screen
            Image(systemName: "mustache.fill")
            Text("Joke")
        }
        .foregroundStyle(Color.theme.secondaryText)
        .font(.system(size: 20))
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
        .onTapGesture {
            debugPrint("report done")
        }
    }
}
