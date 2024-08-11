//
//  HomeScreen.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        
        if appState.isFullScreen {
            CardDetailView(card:viewModel.displayingCard.first!)
        } else {
            ZStack{
                CardContainerView(viewModel: viewModel)
                    .environmentObject(appState)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(AppState(isFullScreen: false))
    }
}
