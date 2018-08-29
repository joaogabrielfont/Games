//
//  User.swift
//  Games
//
//  Created by João Gabriel  on 29/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import Foundation
class User {
    let name: String
    let lastName: String
    let avatar: String
    let email: String
    let birthday: String
    let address: String
    let city: String
    let country: String
    let token: String
    
    struct userKeys {
        static let name = "name"
        static let lastName = "lastname"
        static let avatar = "avatar"
        static let email = "email"
        static let birthday = "birthday"
        static let city = "city"
        static let address = "address"
        static let country = "country"
        static let token = "token"
    }
    
    init(userDictionary: [String : Any]) -> User {
        if let name = userDictionary[userKeys.name] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        if let lastName = userDictionary[userKeys.lastName] as? String {
            self.lastName = lastName
        } else {
            self.lastName = ""
        }
        if let avatar = userDictionary[userKeys.avatar] as? String {
            self.avatar = avatar
        } else {
            self.avatar = ""
        }
        if let email = userDictionary[userKeys.email] as? String {
            self.email = email
        } else {
            self.email = ""
        }
        
        if let birthday = userDictionary[userKeys.birthday] as? String {
            self.birthday = birthday
        } else {
            self.birthday = ""
        }
        
        if let address = userDictionary[userKeys.address] as? String {
            self.address = address
        } else {
            self.address = ""
        }
        
        if let city = userDictionary[userKeys.city] as? String {
            self.city = city
        } else {
            self.city = ""
        }
    
        if let country = userDictionary[userKeys.country] as? String {
            self.country = country
        } else {
            self.country = ""
        }
        if let token = userDictionary[userKeys.token] as? String {
            self.token = token
        } else {
            self.token = ""
        }
    }
}
