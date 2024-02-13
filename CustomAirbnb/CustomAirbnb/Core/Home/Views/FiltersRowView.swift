//
//  FiltersRow.swift
//  CustomAirbnb
//
//  Created by Uri on 4/2/24.
//

import SwiftUI

struct FiltersRowView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            sortMenu
            Spacer()
            filtersHStack
        }
        .frame(height: 10)
        .padding(.bottom, 2)
        .padding(.trailing, 20)
        .padding(.leading, 10)
    }
}

struct FiltersRowView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersRowView()
            .environmentObject(HomeViewModel())
    }
}

extension FiltersRowView {
    
    private var sortMenu: some View {
        Menu {
            ForEach(SortOption.allCases, id: \.self) { sortOption in
                Button(action: {
                    viewModel.sortOption = sortOption
                }) {
                    sortOption.displayName()
                }
            }
        } label: {
            menuTitleView(sortOption: viewModel.sortOption)
        }
        .tint(Color.theme.airRed)
    }
    
    private func menuTitleView(sortOption: SortOption) -> some View {
        sortOption.displayName()
    }
    
    private var filtersHStack: some View {
        HStack(spacing: 5) {
            Text("Filters")
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
        .foregroundStyle(Color.theme.airRed)
        .onTapGesture {
            viewModel.showFiltersView = true
        }
    }
}
