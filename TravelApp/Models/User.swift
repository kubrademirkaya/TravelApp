//
//  User.swift
//  LoginLocationApp
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation

struct User: Codable {
    var full_name: String
    var email: String
    var password: String
}

struct logInUser: Codable {
    var email: String
    var password: String
}

struct UserInfo: Codable {
    var full_name: String
    var email: String
    var role: String
}
