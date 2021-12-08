//
//  SearchView.swift
//  SpotifUI-Lab
//
//  Created by Clément Dudit on 24/11/2021.
//

import SwiftUI

struct FavoriteGenre: Hashable {
    let libelle: String
    let picturePath: String
    let color: Color
}

let colors: [Color] = [
    Color(UIColor(red: 0.23, green: 0.12, blue: 0.92, alpha: 0.8)),
    Color(UIColor(red: 0.85, green: 0.22, blue: 0.23, alpha: 0.9)),
    Color(UIColor(red: 0.69, green: 0.8, blue: 0.69, alpha: 0.8)),
    Color(UIColor(red: 0.87, green: 0.29, blue: 0.64, alpha: 0.8))
]

let favoritesGenres: [FavoriteGenre] = [
    FavoriteGenre(libelle: "Variété française", picturePath: "popcorn", color: colors[0]),
    FavoriteGenre(libelle: "Hip-Hop", picturePath: "jefe", color: colors[1]),
    FavoriteGenre(libelle: "Pop", picturePath: "likes", color: colors[2]),
    FavoriteGenre(libelle: "Dance/Electro", picturePath: "ennaboost", color: colors[3])
]

struct SearchView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Text("Rechercher").font(Fonts.headline)
                    Spacer()
                    Button {
                        print("ici")
                    } label: {
                        Image(systemName: "camera")
                            .font(.title3)
                    }
                }
                
                Button {
                    print("Search")
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.body)
                            .foregroundColor(.black)
                            .padding(.vertical, 14)
                            .padding(.leading, 14)
                        Text("Artistes, titres ou podcasts")
                            .foregroundColor(.black)
                            .font(Fonts.body)
                        Spacer()
                    }
                        .background(.white)
                        .cornerRadius(8)
                        .padding(.top, 3)
                }
                
                HStack {
                    Text("Vos genres préférés")
                        .font(Fonts.body)
                    Spacer()
                }
                
                LazyVGrid(columns: columns) {
                    ForEach(favoritesGenres, id: \.self) { genre in
                        Button {
                            print("ici")
                        } label: {
                            VStack(alignment: .leading) {
                                Text(genre.libelle)
                                    .lineLimit(3)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                    .font(Fonts.headline2)
                                
                                HStack(alignment: .bottom) {
                                    Spacer()
                                    Image(genre.picturePath)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80)
                                        .rotationEffect(Angle(degrees: 30))
                                        .padding(.trailing, -15)
                                }
                            }
                        }
                            .frame(height: 120)
                            .background(genre.color)
                            .cornerRadius(3)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
