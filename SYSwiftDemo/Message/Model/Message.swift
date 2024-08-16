//
//  Message.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/15.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var content: String
    var user: User?
    var isCurrentUser: Bool {
        user == nil
    }
    
    init(id: UUID = UUID(), content: String, user: User? = nil) {
        self.id = id
        self.content = content
        self.user = user
    }
}

extension Message{
    
    static let messageSent = Message(content: "Hi! How are you")
    static let messageReceived = Message(content: "I am fine", user: User.others)
}
