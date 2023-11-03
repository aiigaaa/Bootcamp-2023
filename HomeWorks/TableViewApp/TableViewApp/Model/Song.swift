//
//  Song.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import Foundation

struct Song {
    
    let track: String
    let album: String
    let cover: String
    
    static func createSong() -> [Song] {
        var songs: [Song] = []
        let tracks = DataManager.shared.track
        let albums = DataManager.shared.album
        let covers = DataManager.shared.cover
        
        for i in 0..<tracks.count {
            let song = Song(track: tracks[i], album: albums[i], cover: covers[i])
            songs.append(song)
        }
        
        return songs
    }
    
}



