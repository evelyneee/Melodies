//
//  ContentView.swift
//  Melodies
//
//  Created by Charles Bélanger on 2021-01-09.
//

import SwiftUI

struct ContentView: View {
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
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
