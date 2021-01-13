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
    var body: some View {
        NavigationView {
            List {
                Spacer()
                NavigationLink(destination: LibraryView()) {
                    HStack {
                        Image(systemName: "music.note")
                            .font(.title3)
                        Text("Library")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                Divider()
                NavigationLink(destination: NowPlayingView(albumName: $currentAlbum, artistName: $currentArtist, currentSong: $currentSong)) {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
