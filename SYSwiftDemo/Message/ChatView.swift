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
    @State var typingMessage: String = ""
    @State var scrollProxy: ScrollViewProxy? = nil
    @EnvironmentObject var appState: AppState
    
    init(user: User) {
        self.user = user;
        chatManager = ChatManager(user: user)
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack{
                Spacer(minLength: 80)
                ScrollView(.vertical, showsIndicators: false){
                    ScrollViewReader { proxy in
                        VStack{
                            ForEach(chatManager.messages, id: \.id){ message in
                                MessageView(message: message)
                                    .animation(.easeIn, value: chatManager.messages.count)
                                    .transition(.move(edge: .trailing))
                                    .id(message.id)
                            }
                        }.onAppear{
                            scrollProxy = proxy
                        }
                    }
                }
                ZStack(alignment: .trailing){
                    Color.gray.opacity(0.1)
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(.gray)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal)
                    Button("send"){
                        sendMessage()
                    }
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? .gray : Color.accentColor)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.opacity(0.3), lineWidth: 1)
                }
                .padding(.horizontal)
            }
            ChatViewHeader(name: user.name, photo: user.photo) {}
            .frame(height: 80)
        }
        .onChange(of: chatManager.keyboardIsShowing) { newValue in
            if newValue {
                scrollToBottom()
            }
        }
        .onChange(of: chatManager.messages.count) { newValue in
            scrollToBottom()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear(){
            appState.isFullScreen = true
        }
        .onDisappear(){
            appState.isFullScreen = false
        }
    }
    
    func sendMessage() -> Void {
        chatManager.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatManager.messages.last?.id, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.others)
            .environmentObject(AppState(isFullScreen: true))
    }
}
