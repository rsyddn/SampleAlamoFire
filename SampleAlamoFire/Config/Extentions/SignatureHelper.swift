//
//  SignatureHelper.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation
import CryptoKit

struct SignatureHelper {
    func createSignature(data: [String: Any],secretKey: String)-> String {
        let sortedKey = data.sorted(by: { $0.0 < $1.0 })
        var dataValues: String = ""
        for (_, value) in sortedKey {
            dataValues += value as! String
        }
        let key = bin2hex(secretKey.bytes)
        return digest(dataValues, key).uppercased()
    }

    private func digest(
        _ data: String,
        _ key: String
    )->String {
        let secretString = "HmacSHA256"
        let key = SymmetricKey(data: Data(secretString.utf8))
        let signature = HMAC<SHA256>.authenticationCode(for: Data(data.utf8), using: key)
        return Data(signature).map { String(format: "%02hhx", $0) }.joined()
    }

    private func bin2hex(_ byteArray: [UInt8]) -> String {
        return byteArray.map { String(format: "%02x", $0) }.joined(separator: "")
    }

    private func hex2bin(_ binary: String) -> [UInt8] {
        return String(Int(binary, radix: 16)!, radix: 2).bytes
    }
}

extension String {
    var bytes: [UInt8] {
        get {
            return self.cString(using: String.Encoding.utf8)!
                .dropLast()
                .map { UInt8(bitPattern: $0) }
        }
    }
}
