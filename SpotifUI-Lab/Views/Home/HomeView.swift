//
//  HomeView.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        let recentlyListened: [[String]] = [
            ["popcorn", "Popcorn"],
            ["jefe", "JEFE"],
            ["likes", "Titres likés"],
            ["ennaboost", "Enna Boost"],
            ["underscore", "Underscore_"],
            ["enboucle", "En boucle"]
        ]

        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
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
                                Image(song[0])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55)
                                Text(song[1])
                                    .font(Fonts.footnote)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            .background(Color.gray.opacity(0.2))
                                .cornerRadius(3)
                                .frame(minWidth: 0, maxWidth: .infinity)
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
                    }
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
