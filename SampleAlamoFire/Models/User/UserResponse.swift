//
//  UserModel.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//


import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    var data: UserData
    var support: Support
}

// MARK: - DataClass
struct UserData: Identifiable,Codable {
    var id: Int
    var email, firstName, lastName: String
    var avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    var url: String
    var text: String
}
