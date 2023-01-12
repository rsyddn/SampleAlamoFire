//
//  TokenResponse.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation

struct TokenResponse : Codable{
    var statusCode: String?
    var statusDesc: String?
    var tokenId: String?
    var tokenExpirity: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case tokenId = "tokenID"
        case tokenExpirity = "tokenExpiry"
    }
}
