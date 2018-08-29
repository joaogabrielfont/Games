//
//  Games.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import Foundation
class Game {
    let id: Int
    let name: String
    let releaseDate: String
    let trailer: String
    let platforms: [String]
    
    struct gameKeys {
        static let id = "id"
        static let name = "name"
        static let releaseDate = "release_Date"
        static let trailer = "trailer"
        static let platforms = "platforms"
    }
    
    init(gameDictionary: [String : Any]) -> Game{
        if let id = gameDictionary[gameKeys.id] as? Int {
            self.id = id
        } else {
            self.id = 0
        }
        if let name = gameDictionary[gameKeys.name] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        if let releaseDate = gameDictionary[gameKeys.releaseDate] as? String {
            self.releaseDate = releaseDate
        } else {
            self.releaseDate = ""
        }
        if let trailer = gameDictionary[gameKeys.trailer] as? String {
            self.trailer = trailer
        } else {
            self.trailer = ""
        }
        if let platforms = gameDictionary[gameKeys.platforms] as? [String] {
            self.platforms = platforms
        } else {
            self.platforms = []
        }
    }
}


