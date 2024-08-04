//
//  AppState.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/3.
//

import Foundation

class AppState: ObservableObject{
    
    @Published var selectedTab:SYTabItemType
    @Published var isFullScreen:Bool
    @Published var isPremium:Bool
    
    init(selectedTab:SYTabItemType = .home, isFullScreen: Bool = false, isPremium:Bool = false){
        self.selectedTab = selectedTab;
        self.isFullScreen = isFullScreen
        self.isPremium = isPremium;
    }
}


struct SYTabBarItem:Hashable{
    
    let title:String
    let icon:String
}

enum SYTabItemType:String {
    case home = "rectangle.fill.on.rectangle.fill"
    case live = "play.tv.fill"
    case message = "message.fill"
    case profile = "person.fill"
}
