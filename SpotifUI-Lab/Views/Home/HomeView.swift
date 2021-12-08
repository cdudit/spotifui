//
//  HomeView.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import SwiftUI

struct RecentlyPlayed: Hashable {
    let name: String
    let picturePath: String
}

let recentlyListened: [RecentlyPlayed] = [
    RecentlyPlayed(name: "Popcorn", picturePath: "popcorn"),
    RecentlyPlayed(name: "JEFE", picturePath: "jefe"),
    RecentlyPlayed(name: "Titres likés", picturePath: "likes"),
    RecentlyPlayed(name: "Enna Boost", picturePath: "ennaboost"),
    RecentlyPlayed(name: "Underscore_", picturePath: "underscore"),
    RecentlyPlayed(name: "En boucle", picturePath: "enboucle")
]

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // MARK: Toolbar
                    HStack(spacing: 23) {
                        Text("Bonjour").font(Fonts.headline)
                        
                        Spacer()
                        
                        Button {
                            print("ici")
                        } label: {
                            Image(systemName: "bell")
                                .font(.title3)
                        }
                        
                        Button {
                            print("ici")
                        } label: {
                            Image(systemName: "clock.arrow.circlepath")
                                .font(.title3)
                        }
                        
                        Button {
                            print("ici")
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.title3)
                        }
                    }.padding(.bottom, 10)
                    
                    // MARK: Lastlistening
                    LazyVGrid(columns: columns) {
                        ForEach(recentlyListened, id: \.self) {song in
                            HStack {
                                Image(song.picturePath)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55)
                                Text(song.name)
                                    .font(Fonts.footnote)
                                Spacer()
                            }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(3)
                                .shadow(radius: 12)
                        }
                    }
                    
                    // MARK: LabelSectionArea
                    VStack(alignment: .leading) {
                        Text("Albums tendances pour vous")
                            .font(Fonts.headline)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack(alignment: .leading) {
                                Image("RAM")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Random Access Memories")
                                        .font(Fonts.subhead)
                                        .lineLimit(1)
                                    Text("Album • Daft Punk")
                                        .font(Fonts.caption1)
                                        .foregroundColor(Color.gray)
                                        .lineLimit(1)
                                }
                            }.frame(width: 150)
                        }
                    }.padding(.top, 20)
                }.padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
