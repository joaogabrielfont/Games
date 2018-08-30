//
//  User.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import UIKit
class User {
    let name: String
    let lastName: String
    let avatarURL: String
    var avatar: UIImage?
    let email: String
    let birthday: String
    let address: String
    let city: String
    let country: String
    let token: String
    
    struct userKeys {
        static let name = "name"
        static let lastName = "lastname"
        static let avatarURL = "avatar"
        static let email = "email"
        static let birthday = "birthday"
        static let city = "city"
        static let address = "address"
        static let country = "country"
        static let token = "token"
    }
    
    init?(userDictionary: [String : Any]) {
        guard let name = userDictionary[userKeys.name] as? String, let lastName = userDictionary[userKeys.lastName] as? String, let avatarURL = userDictionary[userKeys.avatarURL] as? String, let email = userDictionary[userKeys.email] as? String, let birthday = userDictionary[userKeys.birthday] as? String, let address = userDictionary[userKeys.address] as? String, let city = userDictionary[userKeys.city] as? String, let country = userDictionary[userKeys.country] as? String ,let token = userDictionary[userKeys.token] as? String else {
            return nil
        }
        self.name = name
        self.lastName = lastName
        self.avatarURL = avatarURL
        self.email = email
        self.birthday = birthday
        self.address = address
        self.city = city
        self.country = country
        self.token = token
    }
    
    func downloadAvatar() {
        OnlineService.getImage(stringURL: self.avatarURL) { (image) in
            if let image = image {
                self.avatar = image
                NotificationCenter.default.post(name: .UserImageDownloaded, object: nil, userInfo: [NotificationKeys.userEmail: self.email])
            }
        }
    }
}
