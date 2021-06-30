//
//  Banner.swift
//  NetMusicPlayer
//
//  Created by TAKESI NANASE on 2021/6/30.
//

import Combine

struct Banner: Identifiable, Codable {
    let id: Int
    var url: String
    var typeId: Int
    var typeStr: String
}

class BannerStore: ObservableObject {
    
    @Published var banners: [Banner] = []
    
    init() {
        self.queryBanners() {banners in
            for item in banners {
                self.banners.append(item)
                print(item.url)
            }
        }
    }
    
    func queryBanners(completion: @escaping ([Banner]) -> ()) {
        var banners: [Banner] = []
        for index in 1...10 {
            banners.append(Banner(id: index, url: "Images/2022-bmw-m5-cs-\(index)", typeId: index, typeStr: "\(index)"))
        }
        completion(banners)
    }
}
