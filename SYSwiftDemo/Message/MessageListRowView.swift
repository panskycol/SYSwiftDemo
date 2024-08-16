//
//  MessageListRowView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import SwiftUI

struct MessageListRowView: View {
    var messagePreview: MessagePreview
    var body: some View {
        HStack(spacing: 15, content: {
            CircleAvator(photo: messagePreview.user.photo, size: 80)
            VStack(alignment: .leading, spacing: 5, content: {
                Text(messagePreview.user.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                Text(messagePreview.lastMessage)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            })
            Spacer()
        })
    }
}

struct MessageListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            MessageListRowView(messagePreview: MessagePreview.examples[0])
            MessageListRowView(messagePreview: MessagePreview.examples[1])
        }
    }
}
