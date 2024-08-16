//
//  CircleAvator.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/16.
//

import SwiftUI

struct CircleAvator: View {
    
    var photo: String
    var size: Double
    var body: some View {
        Image(photo)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(content: {
                Circle().stroke(.white, lineWidth: 5)
            })
            .shadow(radius: 1)
        
    }
}

#Preview {
    CircleAvator(photo: "image_0", size: 100)
}
