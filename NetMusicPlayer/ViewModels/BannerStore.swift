//
//  BannerStore.swift
//  NetMusicPlayer
//
//  Created by takesi on 7/1/21.
//

import Combine

class BannerStore: ObservableObject {
    
    @Published var banners: [Banner] = []
    
    init() {
        self.queryBanners() {banners in
            for item in banners {
                self.banners.append(item)
            }
        }
    }
    
    func queryBanners(completion: @escaping ([Banner]) -> ()) {
        var banners: [Banner] = []
        for index in 1...10 {
            banners.append(Banner(id: index, url: "https://y.qq.com/musicmac/v6/album/detail.html?albumid=18889348", typeId: index, typeStr: "\(index)"))
        }
        completion(banners)
    }
}
