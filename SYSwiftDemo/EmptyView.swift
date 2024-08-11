//
//  EmptyView.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/9.
//

import SwiftUI

struct EmptyView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            Image("image_0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle(), style: FillStyle())
            Spacer()
                .frame(height:20)
            Text("没有更多内容了，懂法守法收款发货速度快发哈苏卡达发哈司法送达了司法考司法好卡深大发哈沙发上开发等哈发撒")
                .padding(.horizontal, 30)
            Spacer()
                .frame(height:20)
            Button("点击重来") {
                // 添加点击事件处理逻辑
                viewModel.resetSource()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .frame(maxHeight: .infinity)
        
    }
}

#Preview {
    EmptyView(viewModel: HomeViewModel())
}
