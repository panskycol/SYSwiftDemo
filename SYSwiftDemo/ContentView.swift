//
//  ContentView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/2.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appState = AppState()
    private let homeScreenView = HomeScreen()
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1)
                        .ignoresSafeArea(edges: .bottom)
            VStack {
                switch appState.selectedTab{
                case .home:
                    HomeScreen()
                        .environmentObject(appState)
                        .background(Color.white)
                case .live:
                    Text("Live")
                        .background(Color.white)
                case .message:
                    Text("Message")
                        .background(Color.white)
                case .profile:
                    Text("Profile")
                        .background(Color.white)
                }
                
                if !appState.isFullScreen{
                    Spacer()
                    HStack{
                        createTabBarItem(tab: .home, title: "Home")
                        createTabBarItem(tab: .live, title: "Live")
                        createTabBarItem(tab: .message, title: "Message")
                        createTabBarItem(tab: .profile, title: "Profile")
                    }
                }
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
