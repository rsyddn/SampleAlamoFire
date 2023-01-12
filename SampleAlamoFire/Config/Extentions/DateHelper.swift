//
//  DateHelper.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation

struct DateHelper {
    func getCurrentDate()-> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.locale = Locale.current
        
        let currentDate = dateFormatter.string(from: date)
        return currentDate
    }
}
