//
//  CardDetailView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/11.
//

import SwiftUI

struct CardDetailView: View {
    
    var card: UserCard
    
    var body: some View {
        
        UserCardView(userCard: card)
        
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]))
            
    }
}
