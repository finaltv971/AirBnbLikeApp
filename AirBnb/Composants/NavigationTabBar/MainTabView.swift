//
//  MainTabView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExplorerView()
                .tabItem{
                    Label("Eplorer", systemImage: "magnifyingglass")
                }
            Favoris()
                .tabItem{
                    Label("Favoris", systemImage: "heart")
                }
            Profile()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
