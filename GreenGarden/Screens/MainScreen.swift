//
//  MainScreen.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView {
            VegetableListScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Second Page")
                .tabItem {
                    Label("My Garden", systemImage: "leaf")
                }
            
        }.accentColor(.teal)
        .navigationTitle("Green Garden")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.white)
            }
        }
        .embedInNavigationView()
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
