//
//  MessageListViewModel.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/14.
//

import Foundation


class MessageListViewModel: ObservableObject{
    
    @Published var messagePreviews:[MessagePreview] = []
    
    init() {
        loadPreviewMessages()
    }
    
    func loadPreviewMessages() {
        self.messagePreviews = MessagePreview.examples
    }
}
