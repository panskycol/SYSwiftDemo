//
//  MessageView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        HStack{
            
            if message.isCurrentUser{
                Spacer()
            }
            Text(message.content)
                .padding(10)
                .foregroundColor(.white)
                .background(message.isCurrentUser ? Color.accentColor : .gray.opacity(0.7))
                .cornerRadius(10)
            if !message.isCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        
        //两条写死的假数据
        let messageSent = Message.messageSent
        let messageReceived = Message.messageReceived
        
        VStack{
            MessageView(message: messageSent)
            MessageView(message: messageReceived)
        }
    }
}
