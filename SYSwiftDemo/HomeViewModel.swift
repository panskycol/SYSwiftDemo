//
//  HomeViewModel.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var displayingCard: [UserCard]
    init() {
        displayingCard = [
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_1","image_2"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_2","image_3"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_3","image_4"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_4","image_5"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_5","image_6"]),
            UserCard(name: "jame", age: 10, place: "London", zodiac: "Cancer", photos: ["image_6","image_7"]),
        ]
    }
}
