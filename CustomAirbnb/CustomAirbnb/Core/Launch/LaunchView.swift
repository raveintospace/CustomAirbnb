//
//  LaunchView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/3/24.
//

import SwiftUI
import Vortex

struct LaunchView: View {
    
    let cities = City.stub
    @State private var cityName: String = "Amsterdam"
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
            
            VortexView(.snow) {
                Text(cityName)
                    .foregroundStyle(Color.launch.accent)
                    .font(.largeTitle)
                    .blur(radius: 1)
                    .tag("circle")
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
                        cityName = cities.randomElement()?.name ?? "Amsterdam"
                }
            }
            
            Image("customlogo")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .ignoresSafeArea()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                showLaunchView = false
            }
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
