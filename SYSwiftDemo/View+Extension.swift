//
//  View+Extension.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import SwiftUI

extension View{
    
    func colorButton(type:ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
}
