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
    @Namespace var namespace
    
    var body: some View {
        
        VStack{
            if !appState.isFullScreen{
                HStack{
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .TANTAN)
                    HomeTitleButton(selectedTitle: $viewModel.selectedTitle, title: .PICKS)
                    Spacer()
                }
                .padding([.leading, .top], 15)
            }
            switchTab()
        }
    }
    
    @ViewBuilder
    func switchTab() -> some View {
        switch viewModel.selectedTitle {
        case .TANTAN:
            if appState.isFullScreen {
                CardDetailView(card:viewModel.displayingCard.first!, namespace: namespace)
                    .environmentObject(appState)
            } else {
                ZStack{
                    if viewModel.hasMoreCard {
                        CardContainerView(viewModel: viewModel, namespace: namespace)
                            .environmentObject(appState)
                    } else {
                        EmptyView(viewModel: viewModel)
                    }
                }
            }
        case .PICKS:
            Text("kkkkkk")
        }
    }
    
    enum HomeTitle: String {
        case TANTAN
        case PICKS
    }
}

struct HomeTitleButton: View {
    @Binding var selectedTitle: HomeScreen.HomeTitle
    var title: HomeScreen.HomeTitle
    var body: some View{
        
        Button {
            selectedTitle = title
            print("点击了！")
        } label: {
            Text(title.rawValue)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(selectedTitle == title ? .yellow : .gray)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(AppState(isFullScreen: false))
    }
}
