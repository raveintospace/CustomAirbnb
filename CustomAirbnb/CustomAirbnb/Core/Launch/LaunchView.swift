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
    @State private var currentCityIndex: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
            
            VortexView(.snow) {
                Text(cities[currentCityIndex].name)
                    .foregroundStyle(Color.launch.accent)
                    .font(.largeTitle)
                    .blur(radius: 1)
                    .tag("circle")
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
                        currentCityIndex = (currentCityIndex + 1) % cities.count
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
                withAnimation(.easeOut(duration: 0.3)) {
                    showLaunchView = false
                }
            }
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}

/*
 % cities.count
 when the index reaches the last element in the array (Vancouver), adding 1 and taking the modulo of the array count will bring the index back to the first element (Amsterdam), creating a cyclic effect
 */
