//
//  SampleViewModel.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation

class SampleViewModel: ObservableObject {
    @Published var data : TokenResponse?
    
    func getToken() {
        SampleService.shared.getToken(username: "MT77764DKM83N", password: "YJV3AM0y", transNumber: "1234567890", secretKey: "daYumnMb") { response in
            if let response = response {
                self.data = response
            }
        }
            failure: { error in
               print(error)
            }
    }
}
