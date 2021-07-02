//
//  Banner.swift
//  NetMusicPlayer
//
//  Created by TAKESI NANASE on 2021/6/30.
//
import Foundation

struct Banner: Identifiable, Codable {
    let id: Int
    var url: String
    var typeId: Int
    var typeStr: String
    
    var imageUrl: URL {
        URL(string: url)!
    }
}

