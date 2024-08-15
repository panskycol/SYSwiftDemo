//
//  CardDetailView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/11.
//

import SwiftUI

struct CardDetailView: View {
    
    var card: UserCard
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                UserCardView(userCard: card)
                    .environmentObject(appState)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text(card.name)
                                .font(.system(size: 28, weight: .bold))
                            Text(String(card.age))
                                .font(.system(size: 26, weight: .medium))
                            Spacer()
                        }
                        Text(card.place)
                            .font(.system(size: 26, weight: .light))
                            .foregroundColor(.gray)

                    }
                    Button{
                        
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 40))
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 30)
                    .offset(y: -40)

                }
                
                Spacer(minLength: 20)
                Text("Dreams are the guiding stars that light up our paths in the vast universe of life. They are the fuel that drives us forward, the source of our motivation and the essence of our existence.When we have a dream, it gives us a sense of purpose. It makes us wake up each morning with a determination to strive for something greater than ourselves. A dream can be as simple as wanting to learn a new language or as grand as finding a cure for a disease that plagues humanity.Take the example of Elon Musk. His dream of making sustainable energy accessible and enabling human colonization of other planets has led to revolutionary advancements in the fields of electric vehicles and space exploration. His story shows us that dreams have the power to change the world.")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
            }.padding([.horizontal, .top], 20)
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]))
            .environmentObject(AppState(isFullScreen: true))
    }
}
