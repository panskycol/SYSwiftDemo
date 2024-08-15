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
    var namespace : Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            ScrollView{
                VStack(alignment: .leading){
                    UserCardView(userCard: card)
                        .environmentObject(appState)
                        .frame(height: UIScreen.main.bounds.height * 0.7)
                        .animation(.linear(duration: 0.1))
                        .matchedGeometryEffect(id: card.id, in: namespace)
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
                            appState.isFullScreen = false
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
                
                Button("share colonization of other"){
                    showActionSheet()
                }
                .foregroundColor(.yellow)
                .font(.system(size: 22))
                .padding(5)
                
                Button("ization of other"){
                    
                }
                .foregroundColor(.yellow)
                .font(.system(size: 22))
                .padding(5)
                
                Button("REPORT \(card.name)"){
                    
                }
                .foregroundColor(.black)
                .font(.system(size: 25, weight: .bold))
                .padding(5)
                
                Spacer(minLength: 100)
            }
            
            HStack(spacing: 20){
                RoundButton(type: .no) {_ in
                }
                RoundButton(type: .star)
                RoundButton(type: .heart)
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .padding( .bottom, 45)
            .background(
                LinearGradient(colors: [.white.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func showActionSheet() {
        let items = ["what do you think about \(card.name)?"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CardDetailView(card: UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]), namespace: namespace)
            .environmentObject(AppState(isFullScreen: true))
    }
}
