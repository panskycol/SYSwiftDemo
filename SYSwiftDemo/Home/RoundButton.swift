//
//  RoundButton.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

enum ButtonType: String, CaseIterable, Identifiable {
    var id: RawValue {rawValue}
    case back = "gobackward"
    case no = "xmark"
    case heart = "heart.fill"
    case star = "star.fill"
}

struct RoundButton: View {
    
    var type:ButtonType
    var buttnClick: ((_: ButtonType) -> Void)?
    
    
    var body: some View {
        Button{
            buttnClick?(type)
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(12)
//                .modifier(ColorButton(type: type))
                .colorButton(type: type)
                .background(Color.black.opacity(0.4))
        }.buttonStyle(PressScaleButton())
    }
}

struct PressScaleButton: ButtonStyle{
    
    func makeBody(configuration:Configuration) -> some View {
        configuration.label.clipShape(Capsule()).scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            
    }
}

struct ColorButton: ViewModifier{
    var type: ButtonType
    @EnvironmentObject var appState: AppState
    
    //这个是ViewModifier协议里面的一个方法
    func body(content: Content) -> some View {
        switch type{
        case.back:
            content
                .foregroundColor(.yellow)
                .background(Color.black.opacity(0.4))
        case.no:
            content.foregroundColor(.white)
                .padding(.horizontal, 30)
                .background(appState.isFullScreen ? Color.yellow : Color.black.opacity(0.4))
        case.heart:
            content.foregroundColor(appState.isFullScreen ? .white : .pink)
                .padding(.horizontal, 30)
                .background(appState.isFullScreen ? Color.pink : Color.black.opacity(0.4))
        case.star:
            content.foregroundColor(appState.isFullScreen ? .white : .blue)
                .background(appState.isFullScreen ? Color.blue : Color.black.opacity(0.4))
        }
    }
}


struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ForEach(ButtonType.allCases){ type in
                
                RoundButton(type: type)
                    .frame(height: 45)
            }
        }.background(Color.gray)
            .environmentObject(AppState(isFullScreen: true))
        
    }
}
