//
//  NotificationConstants.swift
//  Games
//
//  Created by João Gabriel  on 30/08/2018.
//  Copyright © 2018 fontana. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let GameImageDownloaded = Notification.Name("GameImageDownloaded")
    static let UserImageDownloaded = Notification.Name("UserImageDownloaded")
    static let GamesDownloaded = Notification.Name("GamesDownloaded")
}

struct NotificationKeys {
    static let gameId = "gameId"
    static let userEmail = "userEmail"
}
