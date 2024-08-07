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
    @State var offset:CGSize = .zero
    
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
            HStack {
                if offset.width > 0{
                    creatUserCardLabel(title: "LIKE", degree: -20, color: .green)
                } else if offset.width < 0{
                    creatUserCardLabel(title: "NOPE", degree: 20, color: .red)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
            Spacer()
            createUserCardBottomInfo()
        }
        .offset(offset)
        .scaleEffect(getScaleAmount())
        .rotationEffect(Angle(degrees: getScaleAmount()))
        .gesture(
            DragGesture()
                .onChanged{ value in
                    
                    withAnimation(.easeOut(duration: 0.2)){
                        offset = value.translation
                    }
                    print("拉拽了")
                }
                .onChanged{ value in
                    withAnimation(.easeOut(duration: 0.2)){
                        offset = .zero
                    }
                }
        )
    }
    
    func updateImageIndex(hasMoreImage: Bool){
        let nextIndex = hasMoreImage ? imageIndex + 1 : imageIndex - 1;
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
    }
    
    func creatUserCardLabel(title: String, degree: Double, color: Color) -> some View {
        
        Text(title)
            .tracking(3)
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal)
            .foregroundColor(color)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(color, lineWidth: 3)
            )
            .rotationEffect(.degrees(degree))
    }
    
    func getScaleAmount() -> CGFloat {
        
        let max = UIScreen.main.bounds.width/2.0
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.7) * 0.3
    }
    
    func createUserCardBottomInfo() -> some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text("\(userCard.name),\(userCard.age)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                HStack{
                    Text(userCard.zodiac)
                        .fontWeight(.bold)
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(5)
                    Text(userCard.place)
                }
            }
            Spacer()
            Button{
                
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 30))
                    .padding(8)
            }
        }
        .foregroundColor(.white)
        .padding()
        .padding(.bottom, 60)
        .background(
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
        )
        .cornerRadius(20)
        .clipped()
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(userCard: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]))
    }
}
    
