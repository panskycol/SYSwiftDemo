//
//  ChatManager.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import Foundation

class ChatManager: ObservableObject {
    
    @Published var messages = []
    var user: User
    
    init(user: User){
        
        self.user = user
        loadMessage()
    }
    
    func loadMessage() {
        messages = [Message.messageSent, Message.messageReceived]
    }
}
