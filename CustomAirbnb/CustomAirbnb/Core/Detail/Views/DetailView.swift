//
//  DetailView.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import SwiftUI

// intented to deal with @binding management
struct DetailLoadingView: View {
    
    @Binding var listing: Listing?
        
    var body: some View {
        ZStack {
            if let listing = listing {
                DetailView(listing: listing)
            }
        }
    }
}

struct DetailView: View {
    
    enum Sheet: String, Identifiable {
        case bookView, reportView
        var id: String { rawValue }
    }
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @StateObject private var viewModel: DetailViewModel
    
    @Environment(\.dismiss) var dismiss
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(listing: listing))
    }
    
    @State private var sheet: Sheet?
    @State private var showReportThanks: Bool = false
    @State private var showBookRequestConfirmation: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(item: $sheet, content: makeSheet)
                
                VStack(alignment: .leading) {
                    ImagesSlider(listing: viewModel.listing)
                    ApartmentInfoView(listing: viewModel.listing)
                    RedDivider()
                    HostInfoView(listing: viewModel.listing, activateBookView: self.activateBookView)
                    RedDivider()
                    ListingDescriptionView(listing: viewModel.listing)
                    RedDivider()
                    ListingGridView(listing: viewModel.listing)
                    RedDivider()
                }
            }
            .padding(.top, -42)
            
            reportButton
                .padding(.top, 5)
        }
        .safeAreaInset(edge: .bottom) {
            if showReportThanks {
                thanksRectangle
            }
        }
        .background(
            Color.theme.background
        )
        .toolbar() {
            ToolbarItem(placement: .topBarLeading) {
                navigationBarLeadingArrow
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment: .bottom, spacing: 0) {
                    navigationBarTrailingHeart
                    navigationBarTrailingShare
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(listing: dev.listing)
                .environmentObject(dev.homeVM)  // to make preview work
        }
    }
}

extension DetailView {
    
    private var navigationBarLeadingArrow: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "arrow.left")
        })
        .tint(Color.theme.accent)
    }
    
    private var navigationBarTrailingHeart: some View {
        Button(action: {
            withAnimation {
                homeViewModel.updateFavorites(listing: viewModel.listing)
            }
        }, label: {
            Image(systemName: homeViewModel.setDesignForHeartFav(listing: viewModel.listing) ? "heart.fill" : "heart")
                .font(.system(size: 20))
        })
        .tint(homeViewModel.setDesignForHeartFav(listing: viewModel.listing) ? Color.theme.airRed : Color.theme.accent)
    }
    
    private var navigationBarTrailingShare: some View {
        ShareLink(item: URL(string: viewModel.returnListingStringForURL())!) {
            withAnimation {
                Image(systemName: "square.and.arrow.up")
            }
        }
        .tint(Color.theme.accent)
    }
    
    private var reportButton: some View {
        Button(action: {
            sheet = .reportView
        }, label: {
            HStack {
                Image(systemName: "exclamationmark.shield")
                Text("Report listing")
            }
            .foregroundStyle(Color.white)
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
    
    private var thanksRectangle: some View {
        Rectangle()
            .ignoresSafeArea()
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.green).opacity(0.9)
            .overlay(
                HStack(spacing: 2) {
                    Text("Listing reported, thanks")
                    Image(systemName: "checkmark.shield")
                }
                .foregroundStyle(Color.white)
                .bold()
                .font(.system(size: 18))
            )
    }
    
    private func activateReportThanks() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            showReportThanks = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showReportThanks = false
            }
        }
    }
    
    private func activateBookView() {
        sheet = .bookView
    }
    
    private func activateBookRequestConfirmation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            showBookRequestConfirmation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showBookRequestConfirmation = false
            }
        }
    }
    
    @ViewBuilder
    func makeSheet(_ sheet: Sheet) -> some View {
        switch sheet {
        case .bookView:
            BookView(listing: viewModel.listing, viewModel: viewModel, activateBookRequested: self.activateBookRequestConfirmation)
        case .reportView:
            ReportView(viewModel: viewModel, activateReportThanks: self.activateReportThanks)
        }
    }
}
