//
//  CustomAirbnbApp.swift
//  CustomAirbnb
//
//  Created by Uri on 11/12/23.
//

import SwiftUI

@main
struct CustomAirbnbApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    // override navigationBarTitles & tableView appearence (list)
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())    // -> sets iPad navigation like iPhone navigation
                .environmentObject(vm)  // -> Available for the whole app
                
                LaunchView(showLaunchView: $showLaunchView)
                    .opacity(showLaunchView ? 1.0 : 0.0)
                    .zIndex(2.0)
            }
        }
    }
}
