//
//  LaunchView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/3/24.
//

import SwiftUI
import Vortex

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            VortexView(.snow) {
                Text("Amsterdam \nBarcelona \nMadrid")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.launch.accent)
                    .font(.largeTitle)
                    .blur(radius: 1)
                    .tag("circle")
            }
        }
    }
}

#Preview {
    LaunchView()
}

/*
 ZStack {
 
 VortexView(.magic) {
     Text("Barcelona")
         .foregroundStyle(Color.launch.accent)
         .font(.largeTitle)
         .tag("sparkle")
         .blendMode(.plusLighter)
 }
 }
 */
