//
//  TabView.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import SwiftUI
import UIKit

struct TabBarView: View {
    @State private var selection: Int = 2
        
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Accueil", image: "home")
                }.tag(1)
            
            SearchView()
                .tabItem {
                    Label("Recherche", image: "search")
                }.tag(2)
            
            LibraryView()
                .tabItem {
                    Label("Bibliothèque", image: "library")
                }.tag(3)
            
            PremiumView()
                .tabItem {
                    Label("Premium", image: "spotify")
                }.tag(4)
        }.preferredColorScheme(.dark)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
