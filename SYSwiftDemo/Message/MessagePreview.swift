//
//  MessagePreview.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/16.
//

import Foundation

struct MessagePreview: Hashable {
    
    var user: User
    var lastMessage: String
    
    static func == (lhs: MessagePreview, rhs: MessagePreview) -> Bool {
        lhs.user == rhs.user && lhs.lastMessage == rhs.lastMessage
    }
}


extension MessagePreview{
    
    static let example = MessagePreview(user: User.me, lastMessage: "Thank you")
    static let examples = [MessagePreview(user: User.me, lastMessage: "Thank you"),
                           MessagePreview(user: User.others, lastMessage: "one"),
                           MessagePreview(user: User.others2, lastMessage: "two")]
}
