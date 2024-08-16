//
//  User.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/15.
//

import Foundation

struct User: Hashable {
    var name : String
    var photo : String
}

extension User{
    static let me = User(name: "first", photo: "image_0")
    static let others = User(name: "second", photo: "image_1")
    static let others2 = User(name: "third", photo: "image_2")
}
