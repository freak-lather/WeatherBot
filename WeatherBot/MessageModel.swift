//
//  MessageModel.swift
//  WeatherBot
//
//  Created by Anoop tomar on 3/2/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import Foundation

enum User {
    case sender
    case receiver
}

class MessageModel {
    var user: User?
    var message: String?
}
