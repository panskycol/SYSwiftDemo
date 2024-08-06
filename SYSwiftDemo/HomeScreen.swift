//
//  HomeScreen.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        ZStack{
            ForEach(viewModel.displayingCard.reversed(), id: \.id){ car in
                UserCardView(userCard:car)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
