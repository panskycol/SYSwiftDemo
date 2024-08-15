//
//  PickView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/12.
//

import SwiftUI

struct PickView: View {
    var userCard: UserCard
    var blur : Bool
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottomLeading){
                Image(userCard.photos.first!)
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                    .contentShape(Rectangle())
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .if(blur) {
                        $0.blur(radius: 25)
                    }
                Text("\(userCard.name)\n\(userCard.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .if(blur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
        }
        .cornerRadius(16)
    }
}


struct PickView_Previews: PreviewProvider {
    
    static var previews: some View {
        PickView(userCard: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]), blur: true)
            .frame(width: 200, height: 300)
    }
}
