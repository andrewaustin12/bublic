//
//  Message.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import Foundation

struct Message {
    var messageID: String
    var text: String
    var sender: User
    var recipient: User
    var date: Date
}
