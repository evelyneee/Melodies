//
//  ContentView.swift
//  Melodies
//
//  Created by althio on 2021-01-09.
//

import SwiftUI

struct ContentView: View {
    @State var currentSong = "willow"
    @State var currentAlbum = "evermore"
    @State var currentArtist = "Taylor Swift"
    @State var selection: Int?
    var body: some View {
        NavigationView {
            List {
                Spacer()
                NavigationLink(destination: LibraryView(), tag: 0, selection: self.$selection) {
                    HStack {
                        Image(systemName: "music.note")
                            .font(.title3)
                        Text("Library")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                NavigationLink(destination: RecommendedTab(), tag: 1, selection: self.$selection) {
                    HStack {
                        Image(systemName: "sparkles")
                            .font(.title3)
                        Text("Recommended")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                Divider()
                NavigationLink(destination: NowPlayingView(albumName: $currentAlbum, artistName: $currentArtist, currentSong: $currentSong), tag: 2, selection: self.$selection) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                            .font(.title3)
                        Text("Now Playing")
                            .font(.title3)
                            .fontWeight(.bold)
                    }

                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200)
        }
        .frame(minWidth: 1000)
        .onAppear {
            self.selection = 2
            self.selection = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
