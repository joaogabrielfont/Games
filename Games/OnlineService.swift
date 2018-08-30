//
//  GameService.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import Foundation
import Alamofire

class OnlineService {
    static let baseURL = "https://dl.dropboxusercontent.com/s/"
    static let gamesURL = "1b7jlwii7jfvuh0/games"
    static let userURL = "fiqendqz4l1xk61/userinfo"
    
    static func getGames(completion: @escaping([Game]) -> ()) {
        Alamofire.request("\(baseURL)\(gamesURL)").responseJSON { (response) in
            guard let responseData = response.data else {
                completion([])
                return
            }
            do {
                if let dict = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any], let games = dict["games"] as? [[String : Any]] {
                    var gamesArray: [Game] = []
                    for gameDict in games {
                        if let game = Game.init(gameDictionary: gameDict) {
                            game.downloadImage()
                            gamesArray.append(game)
                        }
                    }
                    completion(gamesArray)
                } else {
                    completion([])
                }
            } catch {
                completion([])
            }
        }
    }
    static func getUser(completion: @escaping (User?) -> ()) {
        Alamofire.request("\(baseURL)\(userURL)").responseJSON { (response) in
            guard let responseData = response.data else {
                completion(nil)
                return
            }
            do {
                if let dict = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any] {
                    if let user = User.init(userDictionary: dict) {
                        user.downloadAvatar()
                        completion(user)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
    }
    static func getImage(stringURL: String, completion: @escaping (UIImage?) -> ()) {
        Alamofire.request(stringURL).responseData { (response) in
            if let data = response.data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
}

