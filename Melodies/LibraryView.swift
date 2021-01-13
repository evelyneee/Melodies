//
//  LibraryView.swift
//  Melodies
//
//  Created by althio on 2021-01-09.
//

import SwiftUI

struct LibraryView: View {
    @State var albums: [String] = ["evermore", "drivers license", "folklore"]
    @State var artists: [String] = ["Taylor Swift", "Olivia Rodrigo", "Taylor Swift"]
    @State var songList: [String: String] = ["willow":"evermore", "champagne problems":"evermore", "gold rush":"evermore"]
    @State var openAlbum: [String] = ["evermore", "Taylor Swift"]
    var columns: [GridItem] = [
        GridItem(.fixed(125), spacing: 20),
        GridItem(.fixed(125), spacing: 20),
        GridItem(.fixed(125), spacing: 20)
    ]
    @State var selection: String?
    @State var albumNameBinding: String?
    var body: some View {
        HStack {
//          albums
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(0..<albums.count, id: \.self) { album in
                        Button(action: {
                            openAlbum.removeAll()
                            openAlbum.append(albums[album])
                            openAlbum.append(artists[album])
                        }, label: {
                            VStack(alignment: .leading) {
                                ZStack {
                                    Image("AlbumArt").resizable()
                                        .frame(width: 125, height: 125)
                                        .scaledToFit()
                                        .cornerRadius(5.0)
                                    Image(albums[album]).resizable()
                                        .frame(width: 125, height: 125)
                                        .scaledToFit()
                                        .cornerRadius(5.0)
                                }
                                VStack(alignment: .leading) {
                                    Text(albums[album])
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                    Text(artists[album])
                                        .foregroundColor(.secondary)
                                    }
                                }
                            })
                            .buttonStyle(BorderlessButtonStyle())
                        }
                }
                .padding()
            }
            .onAppear {
                openAlbum.append(albums[0])
                openAlbum.append(artists[0])
            }
            Divider()
            AlbumView(albumName: $openAlbum[0], artistName: $openAlbum[1], albumList: $albums, songList: $songList)
        }
        .frame(minWidth: 750)
    }
}

struct AlbumView: View {
    @Binding var albumName: String
    @Binding var artistName: String
    @Binding var albumList: [String]
    @Binding var songList: [String: String]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(albumName).resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        .cornerRadius(10, antialiased: true)
                        .shadow(radius: 10)
                    VStack(alignment: .leading) {
                        Text(albumName)
                            .fontWeight(.bold)
                            .font(.title2)
                        Text(artistName)
                            .font(.title3)
                        Text("Alternative ~ 2021")
                            .font(.title3)
                    }
                    .padding(.leading, 5)
                    Spacer()
                }
                .padding()
                Spacer()
                ForEach(songList.sorted(by: >), id: \.key) { key, song in
                    HStack {
                        Image(systemName: "play.fill")
                        Text(key)
                            .padding(.leading)
                    }
                    .padding(5)
                }
                .padding(.leading)
            }
        }
        .frame(minWidth: 250)
    }
}
