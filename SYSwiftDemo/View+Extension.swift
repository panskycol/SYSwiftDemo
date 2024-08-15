//
//  View+Extension.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

extension View{
    
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        }else{
            self
        }
    }
    
    func colorButton(type:ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
}
