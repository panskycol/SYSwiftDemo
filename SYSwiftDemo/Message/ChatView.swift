//
//  ChatView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatManager: ChatManager
    var user: User
    
    init(user: User) {
        self.user = user;
        chatManager = ChatManager(user: user)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                ForEach(chatManager.messages.indices, id: \.self){ index in
                    let message = chatManager.messages[index] as! Message
                    MessageView(message: message)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.others)
    }
}
