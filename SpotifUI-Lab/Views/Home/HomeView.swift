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

struct HomeCard: Hashable {
    let name: String
    let picturePath: String
    let type: String
    let author: String
}

let trends: [HomeCard] = [
    HomeCard(name: "Random Access Memories", picturePath: "RAM", type: "Album", author: "Daft Punk"),
    HomeCard(name: "JEFE", picturePath: "jefe", type: "Album", author: "Ninho"),
    HomeCard(name: "Enna Boost", picturePath: "ennaboost", type: "Album", author: "PLK"),
    HomeCard(name: "Réelle Vie 3.0", picturePath: "rellevie", type: "Album", author: "Maes"),
    HomeCard(name: "La fête est finie", picturePath: "lafeteestfinie", type: "Album", author: "Orelsan")
]

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
                    }.padding(.vertical, 10)
                    
                    // MARK: LastListening
                    LazyVGrid(columns: columns) {
                        ForEach(recentlyListened, id: \.self) { song in
                            Button {
                                print("\(song.name)")
                            } label: {
                                HStack {
                                    Image(song.picturePath)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 55, height: 55)
                                    Text(song.name)
                                        .font(Fonts.footnoteBold)
                                        .lineLimit(2)
                                    Spacer()
                                }
                                    .background(Color(UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)))
                                    .cornerRadius(3)
                                    .shadow(radius: 12)
                            }
                        }
                    }
                    
                    // MARK: LabelSectionArea
                    VStack(alignment: .leading) {
                        Text("Albums tendances pour vous")
                            .font(Fonts.headline)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(trends, id: \.self) { trend in
                                    Button {
                                        print("\(trend.name)")
                                    } label: {
                                        VStack(alignment: .leading) {
                                            Image(trend.picturePath)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(height: 150)
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text(trend.name)
                                                    .font(Fonts.subhead)
                                                    .lineLimit(1)
                                                Text("\(trend.type) • \(trend.author)")
                                                    .font(Fonts.caption1)
                                                    .foregroundColor(Color.gray)
                                                    .lineLimit(1)
                                            }
                                        }.frame(width: 150)
                                    }
                                }
                            }
                        }
                    }.padding(.top, 20)
                }.padding()
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [.blue, .black, .black]), startPoint: .topLeading, endPoint: .center)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
