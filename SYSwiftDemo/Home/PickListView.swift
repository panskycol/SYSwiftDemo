//
//  PickListView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/13.
//

import SwiftUI

struct PickListView: View {
    
    var cards : [UserCard]
//    @ObservedObject var viewModel:HomeViewModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            ScrollView(.vertical, showsIndicators: false){
                
                Text("Discover the people you like. Updated daily")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical, 10)
                
                LazyVGrid(
                    columns: [GridItem(.flexible()),GridItem(.flexible())],
                    alignment: .center,
                    spacing: 10.0,
                    pinnedViews: []){
                        ForEach(cards) { card in
                            PickView(userCard: card, blur: true)
                                .frame(height: 240)
                        }
                    }.padding(.bottom, 70)
            }
            .padding(.horizontal, 10)
            
            Button{
                
            } label: {
                Text("Unlock daily picks")
                    .font(.system(size: 18))
                    .padding(.horizontal, 60)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
            }
            .background(Color.yellow)
            .cornerRadius(6)
            .padding(.bottom, 20)
        }
    }
}

//#Preview {
//    PickListView()
//}

struct PickListView_Previews: PreviewProvider {
    
    static var previews: some View {
        PickListView(cards: HomeViewModel().displayingCard)
    }
}
