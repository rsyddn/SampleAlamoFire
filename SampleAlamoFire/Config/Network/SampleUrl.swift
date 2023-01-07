//
//  ApiPath.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation

struct SampleUrl {
    static let baseUrl: String = "https://reqres.in"

    enum Path {
        static let login: String = "/api/login"
        static let getSingleUser: String = "/api/users/2"
        static let getListUser: String = "/api/users?page=2"
    }
}
