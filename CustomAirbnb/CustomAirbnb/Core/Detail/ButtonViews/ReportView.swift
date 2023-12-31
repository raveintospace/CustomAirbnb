//
//  ReportView.swift
//  CustomAirbnb
//
//  Created by Uri on 30/12/23.
//

import SwiftUI

struct ReportView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel: DetailViewModel
    
    @State private var showReportAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    ReportRowView(reason: "Joke", icon: "mustache.fill")
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
                
                .alert(isPresented: $showReportAlert) {
                    Alert(
                        title: Text("Report listing"),
                        message: Text("Are you sure you want to report this listing"),
                        primaryButton: .default(Text("Report")) {
                            dismiss()
                        },
                        secondaryButton: .cancel()
                    )
                }
                .navigationTitle("Reason to report")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        dismissButton
                    }
                })
            }
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
        .listRowBackground(Color.theme.background)
        .onTapGesture {
            showReportAlert = true
        }
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
        .listRowBackground(Color.theme.background)
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
        .listRowBackground(Color.theme.background)
    }
    
    private var explicitReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "eye.trianglebadge.exclamationmark.fill")
            Text("Explicit content")
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.theme.background)
    }
    
    private var photoReason: some View {
        HStack(spacing: 15) {
            Text("")
            Image(systemName: "camera.fill")
            Text("Photos don't match")
        }
        .listRowSeparatorTint(Color.theme.airRed)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.theme.background)
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
        .listRowBackground(Color.theme.background)
    }
    
    private var dismissButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}
