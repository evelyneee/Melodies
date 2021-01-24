//
//  LibraryView.swift
//  Melodies
//
//  Created by althio on 2021-01-09.
//

import SwiftUI

struct LibraryView: View {
    @State var albums: [String] = []
    @State var artists: [String] = []
    @State var songList: [String: String] = [:]
    @State var openAlbum: [String] = ["evermore", "Taylor Swift"]
    var columns: [GridItem] = [
        GridItem(.fixed(125), spacing: 25),
        GridItem(.fixed(125), spacing: 25),
        GridItem(.fixed(125), spacing: 25)
    ]
    @State private var selectedAlbum = Album()
    @State var albumNameBinding: String?
    var body: some View {
        HStack {
//          albums
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Recently Added")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.leading)
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(0..<albums.count, id: \.self) { album in
                            Button(action: {
                                openAlbum.removeAll()
                                openAlbum.append(albums[album])
                                openAlbum.append(artists[album])
                            }) {
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
                                            .foregroundColor(Color.primary)
                                            .fontWeight(.semibold)
                                        Text(artists[album])
                                    }
                                }
                            }
                            .padding(.bottom, 5)
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .padding()
                }
                
            }
            Divider()
            AlbumView(albumName: $openAlbum[0], artistName: $openAlbum[1], albumList: $albums, songList: $songList)
        }
        .onAppear {
            albums = savedAlbums
            artists = savedArtists
            songList = savedSongList
            openAlbum.append(selectedAlbum.albumName)
            openAlbum.append(artists[0])
            print(openAlbum)
            print(selectedAlbum.albumName)
        }
        .frame(minWidth: 800, minHeight: 550)
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
                        .cornerRadius(7, antialiased: true)
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
                ForEach(0..<filterSongList(completeList: songList, forAlbum: albumName).count, id: \.self) { song in
                    HStack {
                        Image(systemName: "play.fill")
                        Text(filterSongList(completeList: songList, forAlbum: albumName)[song])
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
