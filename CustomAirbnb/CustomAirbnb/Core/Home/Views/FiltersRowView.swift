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
            Picker("Sort listings", selection: $viewModel.sortOption) {
                ForEach(SortOption.allCases, id: \.self) { sortOption in
                    Text(sortOption.displayName())
                }
            }
            .pickerStyle(.menu)
            .tint(Color.theme.airRed)
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("Filters")
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .foregroundStyle(Color.theme.airRed)
        }
        .frame(height: 10)
        .padding(.bottom, 2)
        .padding(.trailing, 20)
    }
}

struct FiltersRow_Previews: PreviewProvider {
    static var previews: some View {
        FiltersRowView()
            .environmentObject(HomeViewModel())
    }
}

/*
 Picker("Guests", selection: $viewModel.bedsFilter) {
     ForEach(0..<5) { number in
         Text("\(number)")
     }
 }
 .pickerStyle(.menu)
 */
