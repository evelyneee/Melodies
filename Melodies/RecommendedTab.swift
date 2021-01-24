//
//  RecommendedTab.swift
//  Melodies
//
//  Created by charles on 2021-01-23.
//

import SwiftUI

struct RecommendedTab: View {
    @State var albums: [String] = []
    @State var artists: [String] = []
    @State var songList: [String: String] = [:]
    @State var album = "evermore"
    @State var artist = "Taylor Swift"
    @State private var selectedAlbum = Album()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("Recommended for you")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(getFrequentlyListened(history: ["evermore", "World War Joy", "evermore"], library: savedAlbums).sorted(by: >), id: \.key) { key, listens in
                            Button(action: {
                                selectedAlbum.albumName = key
                                print(selectedAlbum.albumName)
                            }) {
                                ZStack {
                                    Image(key)
                                        .resizable()
                                        .scaledToFill()
                                    LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
                                    HStack {
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Spacer()
                                            Text(key)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.primary)
                                            Text("Listened \(listens) times")
                                        }
                                        .padding(.trailing, 25)
                                        .padding(10)
                                    }

                                }
                                .frame(width: 150, height: 200)
                                .cornerRadius(10)
                                .padding(.leading)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .padding(.leading)
                Spacer()
            }
        }

    }
}
