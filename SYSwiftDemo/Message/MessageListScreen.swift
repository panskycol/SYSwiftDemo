//
//  MessageListScreen.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import SwiftUI

struct MessageListScreen: View {
    @ObservedObject var viewModel = MessageListViewModel()
    @State var searchText: String = ""
    @State var isEditing: Bool = false
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Text("Message")
                        .font(.system(size: 25, weight: .bold))
                        .padding([.leading, .top], 15)
                    Spacer()
                }
                HStack{
                    TextField("search Matches", text: $searchText)
                        .textInputAutocapitalization(.never)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay {
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 15)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isEditing = true
                            }
                        }
                    
                    if isEditing{
                        Button("Cancel"){
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isEditing = false
                            }
                            
                            searchText = ""
                            endEditing(true)
                        }
                        .padding(.trailing, 15)
                        .transition(.move(edge: .trailing))
                    }
                }
            }
            VStack{
                ForEach(viewModel.messagePreviews.filter{searchText.isEmpty ? true : displayPreview($0)}, id: \.self) {
                    preview in
                    NavigationLink(destination: ChatView(user: preview.user)) {
                        MessageListRowView(messagePreview: preview)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .animation(.easeInOut(duration: 0.25), value: viewModel.messagePreviews.count)
                    .transition(.slide)
                }
            }
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
//        .onAppear(){
//            appState.isFullScreen = false
//        }
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        if preview.user.name.contains(searchText) {
            return true
        }
        if preview.lastMessage.contains(searchText) {
            return true
        }
        
        return false
    }
}

struct MessageListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MessageListScreen()
            .environmentObject(AppState(isFullScreen: true))
    }
}
