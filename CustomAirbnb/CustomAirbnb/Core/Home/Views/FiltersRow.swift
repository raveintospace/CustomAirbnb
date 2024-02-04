//
//  FiltersRow.swift
//  CustomAirbnb
//
//  Created by Uri on 4/2/24.
//

import SwiftUI

struct FiltersRow: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            Picker("Sort listings", selection: $viewModel.sortOption) {
                ForEach(SortOption.allCases, id: \.self) { sortOption in
                    Text(sortOption.displayName())
                }
            }
            .pickerStyle(.menu)
            Spacer()
            Picker("Guests", selection: $viewModel.bedsFilter) {
                ForEach(0..<5) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.menu)
        }
        .frame(height: 10)
    }
}

struct FiltersRow_Previews: PreviewProvider {
    static var previews: some View {
        FiltersRow()
            .environmentObject(HomeViewModel())
    }
}
