//
//  HomeViewModel.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var displayingCard: [UserCard]
    @Published var selectedTitle: HomeScreen.HomeTitle = .TANTAN
    
    var hasMoreCard: Bool{
        return !displayingCard.isEmpty
    }
    
    init() {
        displayingCard = [
            UserCard(name: "jame00", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]),
            UserCard(name: "jame11", age: 10, place: "London", zodiac: "Cancer", photos: ["image_1","image_2"]),
            UserCard(name: "jame22", age: 10, place: "London", zodiac: "Cancer", photos: ["image_2","image_3"]),
            UserCard(name: "jame33", age: 10, place: "London", zodiac: "Cancer", photos: ["image_3","image_4"]),
            UserCard(name: "jame44", age: 10, place: "London", zodiac: "Cancer", photos: ["image_4","image_5"]),
            UserCard(name: "jame55", age: 10, place: "London", zodiac: "Cancer", photos: ["image_5","image_6"]),
            UserCard(name: "jame66", age: 10, place: "London", zodiac: "Cancer", photos: ["image_6","image_7"]),
        ]
    }
    
    func resetSource(){
        displayingCard = [
            UserCard(name: "jame00", age: 10, place: "London", zodiac: "Cancer", photos: ["image_0","image_1"]),
            UserCard(name: "jame11", age: 10, place: "London", zodiac: "Cancer", photos: ["image_1","image_2"]),
            UserCard(name: "jame22", age: 10, place: "London", zodiac: "Cancer", photos: ["image_2","image_3"]),
            UserCard(name: "jame33", age: 10, place: "London", zodiac: "Cancer", photos: ["image_3","image_4"]),
            UserCard(name: "jame44", age: 10, place: "London", zodiac: "Cancer", photos: ["image_4","image_5"]),
            UserCard(name: "jame55", age: 10, place: "London", zodiac: "Cancer", photos: ["image_5","image_6"]),
            UserCard(name: "jame66", age: 10, place: "London", zodiac: "Cancer", photos: ["image_6","image_7"]),
        ]
    }
    
    func nextUserCard() {
        if let _ = displayingCard.first{
            displayingCard.removeFirst()
        }
    }
}
