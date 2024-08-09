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
        
        if viewModel.hasMoreCard {
            CardContainerView(viewModel: viewModel)
        } else {
            EmptyView(viewModel: viewModel)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
