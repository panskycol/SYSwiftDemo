//
//  CardContainerView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

struct CardContainerView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ForEach(viewModel.displayingCard.reversed()){ card in
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
                    .environmentObject(appState)
            }
            
            // 喜欢和不喜欢的那几个按钮
            HStack{
                ForEach(ButtonType.allCases){
                    type in
                    RoundButton(type: type, buttnClick: { type in
                        
                        switch type {
                        case .back:
                            debugPrint("roll back")
                        case .no:
                            viewModel.nextUserCard()
                        case .heart:
                            viewModel.nextUserCard()
                        case .star:
                            debugPrint("roll back")
                        }
                    }).frame(height: 45)
                }
            }
            .padding(.bottom, 15)
        }
        .padding(.vertical, 60)
        .padding(.horizontal, 20)
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView(viewModel: HomeViewModel())
            .environmentObject(AppState(isFullScreen: true))
    }
}
