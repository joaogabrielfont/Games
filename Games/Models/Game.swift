//
//  Games.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit
class Game {
    let id: Int
    let name: String
    var image: UIImage?
    let imageURL: String
    let releaseDate: String
    let trailer: String
    let platforms: [String]
    
    struct gameKeys {
        static let id = "id"
        static let name = "name"
        static let image = "image"
        static let releaseDate = "release_date"
        static let trailer = "trailer"
        static let platforms = "platforms"
    }
    
    init?(gameDictionary: [String : Any]) {
        guard let id = gameDictionary[gameKeys.id] as? Int, let imageURL = gameDictionary[gameKeys.image] as? String, let name = gameDictionary[gameKeys.name] as? String, let releaseDate = gameDictionary[gameKeys.releaseDate] as? String, let trailer = gameDictionary[gameKeys.trailer] as? String, let platforms = gameDictionary[gameKeys.platforms] as? [String] else {
            return nil
        }
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.releaseDate = releaseDate
        self.trailer = trailer
        self.platforms = platforms
    }
    
    func downloadImage() {
        OnlineService.getImage(stringURL: self.imageURL) { (image) in
            if let image = image {
                self.image = image
                NotificationCenter.default.post(name: .GameImageDownloaded, object: nil, userInfo: [NotificationKeys.gameId: self.id])
            }
        }
    }
}


