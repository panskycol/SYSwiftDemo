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
    var namespace: Namespace.ID
    
    var body: some View {
        
        GeometryReader{ proxy in
            ZStack(alignment: .bottom) {
                
                ForEach(viewModel.displayingCard.reversed()){ card in
                    UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
                        .environmentObject(appState)
                        .animation(.linear(duration: 0.1))
                        .matchedGeometryEffect(id: card.id, in: namespace)
                        .clipped()
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
            .padding(.bottom, 60)
            .padding(.horizontal, 20)
        }
        
        
    }
}

struct CardContainerView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CardContainerView(viewModel: HomeViewModel(), namespace: namespace)
            .environmentObject(AppState(isFullScreen: true))
    }
}
