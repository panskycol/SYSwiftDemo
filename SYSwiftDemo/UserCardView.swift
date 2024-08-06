//
//  UserCardView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

struct UserCardView: View {
    var userCard: UserCard
    @State var imageIndex = 0
    
    var body: some View {
        GeometryReader{ proxy in
            Image(userCard.photos[imageIndex])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .cornerRadius(20)
            
            HStack{
                
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(hasMoreImage: false)
                    }
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(hasMoreImage: true)
                    }
            }.foregroundColor(.white.opacity(0.01))
            
            HStack{
                ForEach(0..<userCard.photos.count, id: \.self){
                    imageIndex in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 4)
                        .foregroundColor(self.imageIndex == imageIndex ? .white : .gray.opacity(0.5))
                }
            }
            .padding(.top, 10)
            .padding(.horizontal)
        }
    }
    
    func updateImageIndex(hasMoreImage: Bool){
        let nextIndex = hasMoreImage ? imageIndex + 1 : imageIndex - 1;
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(userCard: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]))
    }
}
    
