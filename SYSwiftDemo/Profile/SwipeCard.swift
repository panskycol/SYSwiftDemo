//
//  SwipeCard.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/18.
//

import SwiftUI

struct SwipeCard: View {
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView {
                SingleSwipeCard(title: "Get TanTan Gold", description: "See who likes you & more!")
                SingleSwipeCard(title: "Get TanTan Faster", description: "Boost profile once a month")
                SingleSwipeCard(title: "Increase Your Chances", description: "11See who likes you & more!")
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button {
                
            } label: {
                Text("MY TANTAN PLUS")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
            }
            .padding(.bottom, 30)
        }
    }
    
    struct SingleSwipeCard: View {
        var title: String
        var description: String
        var body: some View{
            VStack(spacing: 10) {
                Spacer()
                Text(title)
                    .font(.system(size: 26, weight: .semibold))
                Text(description)
            }
            .padding(.bottom, 60)
        }
    }
}

struct SwipeCard_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCard()
    }
}
