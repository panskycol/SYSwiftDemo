//
//  User.swift
//  SYSwiftDemo
//
//  Created by Pan skycol on 2024/8/15.
//

import Foundation

struct User {
    var name : String
    var photo : String
}

extension User{
    static let me = User(name: "userSent", photo: "image_0")
    static let others = User(name: "UserReceived", photo: "image_1")
}
