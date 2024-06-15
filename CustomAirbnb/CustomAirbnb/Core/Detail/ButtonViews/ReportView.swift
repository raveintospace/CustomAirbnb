//
//  ReportView.swift
//  CustomAirbnb
//
//  Created by Uri on 30/12/23.
//

import SwiftUI

struct ReportView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: DetailViewModel
    
    @State private var selectedReportReason: ReportReason? = nil
    @State private var showReportAlert: Bool = false
    
    // notifies DetailView to activate a thanks message
    var activateReportThanks: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    ForEach(viewModel.reportReasons) { reportReason in
                        ReportRowView(reason: reportReason.reason, icon: reportReason.icon)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedReportReason = reportReason
                                }
                                showReportAlert = true
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedReportReason?.id == reportReason.id ? Color.theme.airRed : Color.clear, lineWidth: 1)
                                    .padding(.horizontal, 4)
                                )
                    }
                }
                .foregroundStyle(Color.theme.secondaryText)
                .font(.system(size: 20))
                .padding(.top, 5)
                .listStyle(.plain)
                
                .alert(isPresented: $showReportAlert) {
                    Alert(
                        title: Text("Report listing"),
                        message: Text("Are you sure you want to report this listing"),
                        primaryButton: .destructive(Text("Cancel")) {
                            removeSelectedReportReason()
                        },
                        secondaryButton: .default(Text("Report")) {
                            dismiss()
                            self.activateReportThanks()
                        }
                    )
                }
                .navigationTitle("Reason to report")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        DismissXButton()
                    }
                })
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReportView(viewModel: DetailViewModel(listing: dev.listing), activateReportThanks: {})
        }
    }
}

extension ReportView {
    
    private func removeSelectedReportReason() {
        selectedReportReason = nil
    }
}
