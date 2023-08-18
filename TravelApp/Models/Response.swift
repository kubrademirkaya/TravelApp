//
//  Reponse.swift
//  LoginLocationApp
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation

struct Response: Codable {
    var message: String
    var status: String
}

struct loginResponse: Codable {
    var accessToken: String
    var refreshToken: String
}


