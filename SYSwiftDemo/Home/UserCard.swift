//
//  UserCard.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/4.
//

import Foundation

struct UserCard : Identifiable{
    let id = UUID()
    let name: String
    let age: Int
    let place: String
    let zodiac: String
    let photos: [String]
}
