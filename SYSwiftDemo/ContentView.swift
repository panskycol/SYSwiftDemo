//
//  ContentView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/2.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appState = AppState()
    
    var body: some View {
        VStack {
            switch appState.selectedTab{
            case .home:
                Text("Home")
            case .live:
                Text("Live")
            case .message:
                Text("Message")
            case .profile:
                Text("Profile")
            }
            Spacer()
            HStack{
                createTabBarItem(tab: .home, title: "Home")
                createTabBarItem(tab: .live, title: "Live")
                createTabBarItem(tab: .message, title: "Message")
                createTabBarItem(tab: .profile, title: "Profile")
            }
        }
    }
    
    func createTabBarItem(tab:SYTabItemType, title: String) -> some View {
        
        Button{
            appState.selectedTab = tab
        } label: {
            VStack{
                Image(systemName: tab.rawValue)
                    .font(.system(size: 24))
                    .foregroundColor(appState.selectedTab == tab ? .accentColor : Color.gray.opacity(0.5))
                    .frame(maxWidth: .infinity)
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(appState.selectedTab == tab ? .accentColor:Color.gray.opacity(0.5))
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
