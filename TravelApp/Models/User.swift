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

//Travels

struct Travel: Codable {
    var id: String
    var visit_date: String
    var location: String
    var information: String
    var image_url: String
    var latitude: Double
    var longitude: Double
    var created_at: String
    var updated_at: String
}

struct TravelResponse: Codable {
    var data: TravelData
    var status: String
}

struct TravelData: Codable {
    var count: Int
    var travels: [Travel]
}

//ImageSlider

struct ImageResponse: Codable {
    let data: ImageData
    let status: String
}

struct ImageData: Codable {
    let images: [Image]
    let count: Int
}

struct Image: Codable {
    let id: String
    let travel_id: String
    let image_url: String
    let caption: String
    let created_at: String
    let updated_at: String
}
