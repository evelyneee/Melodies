//
//  backendCore.swift
//  Melodies
//
//  Created by charles on 2021-01-18.
//

import Foundation

public class Album {
    @Published var albumName = ""
}

public func filterSongList(completeList: [String:String], forAlbum: String) -> [String] {
    var output: [String] = []
    for song in completeList.keys {
        if completeList[song] == forAlbum {
            output.append(song)
        }
    }
    return output
}

public func getFrequentlyListened(history: [String], library: [String]) -> [String: Int] {
    var counts: [String:Int] = [:]
    for song in history {
        counts[song, default: 0] += 1
    }
    return counts
}
public struct song {
    var songName: String
    var artist: String
    var album: String
    var songCount: Int
    var albumURL: URL
    var albumArtURL: URL
    var addDate: Int
    var year: Int
    var genre: String
    enum origin {
        case applemusic
        case tidal
        case spotify
        case ytmusic
        case localimport
        case local
        case unknown
    }
}
