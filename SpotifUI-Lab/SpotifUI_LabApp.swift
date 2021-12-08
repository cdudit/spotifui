//
//  SpotifUI_LabApp.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import SwiftUI

@main
struct SpotifUI_LabApp: App {
    
    init() {
        SpotifyTheme.shared.setupTheme()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
