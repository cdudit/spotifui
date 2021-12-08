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
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

let favoritesGenres: [FavoriteGenre] = [
    FavoriteGenre(libelle: "Variété française", picturePath: "popcorn"),
    FavoriteGenre(libelle: "Hip-Hop", picturePath: "jefe"),
    FavoriteGenre(libelle: "Pop", picturePath: "likes"),
    FavoriteGenre(libelle: "Dance/Electro", picturePath: "ennaboost")
]

let browseAll: [FavoriteGenre] = [
    FavoriteGenre(libelle: "Rétrospective", picturePath: "popcorn"),
    FavoriteGenre(libelle: "Classements", picturePath: "jefe"),
    FavoriteGenre(libelle: "Podcasts", picturePath: "likes"),
    FavoriteGenre(libelle: "Nouveautés", picturePath: "ennaboost")
]

struct SearchView: View {
    let columns = [
        GridItem(.flexible(), spacing: 15),
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
                }.padding(.top, 10)
                
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
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(favoritesGenres, id: \.self) { genre in
                        Button {
                            print("ici")
                        } label: {
                            VStack(alignment: .leading) {
                                Text(genre.libelle)
                                    .lineLimit(3)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                    .font(Fonts.headline3)
                                
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
                            .background(Color(uiColor: UIImage(named: genre.picturePath)?.averageColor ?? UIColor.systemGray))
                            .cornerRadius(4)
                    }
                }
                
                HStack {
                    Text("Parcourir tout")
                        .font(Fonts.body)
                    Spacer()
                }
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(browseAll, id: \.self) { genre in
                        Button {
                            print("ici")
                        } label: {
                            VStack(alignment: .leading) {
                                Text(genre.libelle)
                                    .lineLimit(3)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                    .font(Fonts.headline3)
                                
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
                            .background(Color(uiColor: UIImage(named: genre.picturePath)?.averageColor ?? UIColor.systemGray))
                            .cornerRadius(4)
                    }
                }
            }
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
