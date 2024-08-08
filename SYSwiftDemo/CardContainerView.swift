//
//  CardContainerView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

struct CardContainerView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ForEach(viewModel.displayingCard.reversed()){ card in
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
            }
            
            HStack{
                ForEach(ButtonType.allCases){
                    type in
                    RoundButton(type: type).frame(height: 45)
                }
            }.padding(.bottom, 15)
        }
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView(viewModel: HomeViewModel())
    }
}
