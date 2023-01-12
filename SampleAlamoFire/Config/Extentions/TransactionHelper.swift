//
//  TransactionHelper.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation

struct TransactionHelper{
    func getTransNumber(transNumber: String)->String {
        var transactionNumber: String = ""
        if (transNumber == "") {
            var uuid = UUID().uuidString
            let regex = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, uuid.count)
            let temp = regex.stringByReplacingMatches(in: uuid, options: [], range: range, withTemplate: "")
            transactionNumber = temp
        } else {
            let regex = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, transNumber.count)
            let temp = regex.stringByReplacingMatches(in: transNumber, options: [], range: range, withTemplate: "")
            transactionNumber = temp
        }
        return transactionNumber
    }
}
