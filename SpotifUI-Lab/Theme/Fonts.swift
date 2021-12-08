//
//  Fonts.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import UIKit
import SwiftUI

struct Fonts {
    
    // MARK: - Properties
    
    static var UILargeTitle: UIFont { UISpotifyBlack(size: 35) }
    static var UIHeadline: UIFont { UISpotifyBold(size: 17) }
    static var UIBody: UIFont { UISpotifyBook(size: 17) }
    static var UISubhead: UIFont { UISpotifyBold(size: 15) }
    static var UIFootnote: UIFont { UISpotifyBook(size: 13) }
    static var UICaption1: UIFont { UISpotifyBook(size: 13) }
    static var UICaption2: UIFont { UISpotifyBook(size: 10) }
    
    static var largeTitle: Font { spotifyBlack(size: 35) }
    static var headline: Font { spotifyBold(size: 25) }
    static var body: Font { spotifyBook(size: 17) }
    static var subhead: Font { spotifyBold(size: 15) }
    static var footnote: Font { spotifyBook(size: 13) }
    static var caption1: Font { spotifyBook(size: 13) }
    static var caption2: Font { spotifyBook(size: 10) }
    
    
    // MARK: - Methods
    
    // UIKit
    private static func UISpotifyBlack(size: CGFloat) -> UIFont {
        UIFont(name: "CircularSpUIv3T-Black", size: size) ?? .systemFont(ofSize: size, weight: .black)
    }
    
    private static func UISpotifyBold(size: CGFloat) -> UIFont {
        UIFont(name: "CircularSpUIv3T-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
    }
    
    private static func UISpotifyBook(size: CGFloat) -> UIFont {
        UIFont(name: "CircularSpUIv3T-Book", size: size) ?? .systemFont(ofSize: size, weight: .regular)
    }
    
    private static func UISpotifyLight(size: CGFloat) -> UIFont {
        UIFont(name: "CircularSpUIv3T-Light", size: size) ?? .systemFont(ofSize: size, weight: .light)
    }
    
    // SwiftUI
    private static func spotifyBlack(size: CGFloat) -> Font {
        Font.custom("CircularSpUIv3T-Black", size: size)
    }
    
    private static func spotifyBold(size: CGFloat) -> Font {
        Font.custom("CircularSpUIv3T-Bold", size: size)
    }
    
    private static func spotifyBook(size: CGFloat) -> Font {
        Font.custom("CircularSpUIv3T-Book", size: size)
    }
    
    private static func spotifyLight(size: CGFloat) -> Font {
        Font.custom("CircularSpUIv3T-Light", size: size)
    }
}
