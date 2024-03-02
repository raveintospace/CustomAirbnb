//
//  DetailView.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import SwiftUI
import Lottie

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
    @State private var showHearts: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(item: $sheet, content: makeSheet)
                
                VStack(alignment: .leading) {
                    ImagesSlider(listing: viewModel.listing, showHearts: $showHearts)
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
            .padding(.top, -42) // picture under toolbar
            
            reportButton
                .padding(.top, 5)
        }
        .safeAreaInset(edge: .bottom) {
            if showReportThanks {
                ConfirmationRectangle(copy: "Listing reported, thanks", iconName: "checkmark.shield")
            } else if showBookRequestConfirmation {
                ConfirmationRectangle(copy: "Book request sent", iconName: "clock.badge.checkmark")
            }
        }
        .background(
            Color.theme.background
        )
        .toolbar() {
            ToolbarItem(placement: .topBarLeading) {
                TopBarLeadingArrow()
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment: .bottom, spacing: 0) {
                    topBarTrailingHeart
                    topBarTrailingShare
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
    
    private var topBarTrailingHeart: some View {
        Button(action: {
            withAnimation {
                homeViewModel.updateFavorites(listing: viewModel.listing)
                if homeViewModel.setDesignForHeartFav(listing: viewModel.listing) {
                    activateHearts()
                }
            }
        }, label: {
            Image(systemName: homeViewModel.setDesignForHeartFav(listing: viewModel.listing) ? "heart.fill" : "heart")
                .offset(y: 2.5)
        })
        .tint(homeViewModel.setDesignForHeartFav(listing: viewModel.listing) ? Color.theme.airRed : Color.theme.accent)
    }
    
    private var topBarTrailingShare: some View {
        ShareLink(item: URL(string: viewModel.returnListingStringForURL())!) {
            withAnimation {
                Image(systemName: "square.and.arrow.up")
            }
        }
        .tint(Color.theme.accent)
    }
    
    private func activateHearts() {
        showHearts = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeOut) {
                showHearts = false
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

/*
 Lottie
 https://medium.com/@mobile_44538/lottie-magic-in-swiftui-5d600f068287 - Lottie
 https://lottiefiles.com/animations/heart-E3NfCZitfh - animation
 https://github.com/airbnb/lottie-ios
 */
