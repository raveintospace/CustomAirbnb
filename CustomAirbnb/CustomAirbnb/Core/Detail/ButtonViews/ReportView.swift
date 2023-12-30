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
                spamReason
                doubledReason
                explicitReason
                photoReason
                forbiddenReason
                
            }
            .foregroundStyle(Color.theme.secondaryText)
            .font(.system(size: 20))
            .padding(.top, 5)
            .listStyle(.plain)
            
            .onTapGesture {
                debugPrint("report done")
            }
            
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
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
    
    private var explicitReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "eye.trianglebadge.exclamationmark.fill")
            Text("Explicit content")
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
    
    private var photoReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "camera.fill")
            Text("Photos don't match")
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
    
    private var doubledReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "repeat.1.circle.fill")
            Text("Doubled listing")
                .padding(.leading, 5)
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
    
    private var forbiddenReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "xmark.seal.fill")
            Text("Forbidded content or service")
                .padding(.leading, 5)
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
    
    private var spamReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "s.circle.fill")
            Text("Spam")
                .padding(.leading, 5)
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
    }
}
