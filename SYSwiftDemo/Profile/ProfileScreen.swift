//
//  ProfileScreen.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/18.
//

import SwiftUI
import PhotosUI

struct ProfileScreen: View {
    @StateObject var vm: ProfileViewModel = ProfileViewModel()
    var user: User
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                if let uiImage = vm.selectedImage {
                    ImageFromLocal(uiImage: uiImage)
                } else {
                    ImageFromLocal(uiImage: UIImage(named: user.photo) ?? UIImage())
                }
                
                PhotosPicker(selection: $vm.imageSelection) {
                    
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .offset(x: 10, y: -10)
                }
            }
            .padding()
            Text(user.name)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.black)
            
            HStack(alignment: .center, content: {
                Spacer()
                CustomButton(icon: "gearshape.fill", title: "SETTING", isCenter: false)
                Spacer()
                CustomButton(icon: "camera.fill", title: "ADD MEDIA", isCenter: true)
                Spacer()
                CustomButton(icon: "shield.fill", title: "SAFETY", isCenter: false)
                Spacer()
            })
            .padding(.vertical, 20)
            HStack{
                Text("Photo Tip: Make waves with a beach photo andget more likes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundColor(Color.accentColor)
                        .padding(6)
                }
                .background(Color.white)
                .clipShape(Circle())
            }
            .padding()
            .background(Color.yellow)
            .cornerRadius(6)
            
            ZStack{
                Color.gray.opacity(0.15)
                SwipeCard()
            }
            .padding(.top, 20)
        }
    }
    
    struct CustomButton: View {
        var icon: String
        var title: String
        var isCenter: Bool

        var body: some View{
            VStack (spacing: 10) {
                Button {
                    
                } label: {
                    Image(systemName: icon)
                        .foregroundColor(isCenter ? .white : .gray)
                        .font(.system(size: isCenter ? 30 : 26))
                        .padding(isCenter ? 20 : 10)
                        .background(isCenter ? Color.accentColor : .white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                }
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray.opacity(0.6))
            }
        }
    }
    
    struct ImageFromLocal: View {
        var uiImage: UIImage
        var body: some View {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 10, height: 10)
                .cornerRadius(50)
                .overlay {
                    Circle().stroke(.white, lineWidth: 5)
                }
                .shadow(radius: 1)
        }
    }
    
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(user: User.me)
    }
}
