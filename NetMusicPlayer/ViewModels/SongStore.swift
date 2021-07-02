//
//  SongStore.swift
//  NetMusicPlayer
//
//  Created by takesi on 7/1/21.
//

import Combine
import Alamofire
import SwiftyJSON

//
class SongStore: ObservableObject {
    
    @Published var newSongs: [Song] = []
    
    func queryNewSongs(type: SongArea = .all, compation: @escaping () -> ()) {
        
    }
    
}

enum SongArea: String {
    case inland = "ZH"
    case japan = "JP"
    case all = "ALL"
}
