//
//  SpotifyTheme.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import UIKit

class SpotifyTheme {
    static let shared = SpotifyTheme()
    
    private func tabBarConfiguration() {
        let tabAppearance = UITabBar.appearance()
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font: Fonts.UICaption2], for: .normal)
        tabAppearance.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 0.2)
        tabAppearance.unselectedItemTintColor = UIColor.lightGray
        tabAppearance.shadowImage = UIImage()
        tabAppearance.isOpaque = false
    }
    
    func setupTheme() {
        tabBarConfiguration()
    }
}
