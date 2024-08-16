//
//  ChatManager.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    
    @Published var messages: [Message] = []
    var user: User
    @Published var keyboardIsShowing: Bool = false
    var keyboardPublish: AnyCancellable? = nil
    
    init(user: User){
        
        self.user = user
        loadMessage()
        setUpPublishers()
    }
    
    func setUpPublishers() {
        
        keyboardPublish = Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .subscribe(on: DispatchQueue.main)
        .assign(to: \.keyboardIsShowing, on: self)
    }
    
    func sendMessage(_ message:Message) {
        messages.append(message)
    }
    
    func loadMessage() {
        messages = [Message.messageSent, Message.messageReceived, Message.messageReceived, Message.messageReceived, Message.messageReceived, Message.messageReceived, Message.messageReceived, Message.messageReceived, Message.messageReceived]
    }
}
