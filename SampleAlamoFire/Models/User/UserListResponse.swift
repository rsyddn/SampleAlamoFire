//
//  UserListResponse.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation

struct UserListResponse: Codable {
    var page, perPage, total, totalPages: Int
    var data: [UserData]
    var support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}
