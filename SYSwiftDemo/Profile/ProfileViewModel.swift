//
//  ProfileViewModel.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/18.
//

import Foundation
import PhotosUI
import _PhotosUI_SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil {
        
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    func setImage(from imageSelection: PhotosPickerItem?) {
        
        guard let imageSelection else {
            return
        }
        Task {
            if let data = try? await imageSelection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    // 假设 selectedImage 是一个外部可变的属性或变量
                    self.selectedImage = uiImage
                    return
                }
            }
        }
    }
}
