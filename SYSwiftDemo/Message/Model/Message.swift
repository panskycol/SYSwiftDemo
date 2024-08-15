//
//  Message.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/15.
//

import Foundation

struct Message {
    var content: String
    var user: User?
    var isCurrentUser: Bool {
        user == nil
    }
}

extension Message{
    
    static let messageSent = Message(content: "Hi! How are you")
    static let messageReceived = Message(content: "I am fine", user: User.others)
}
