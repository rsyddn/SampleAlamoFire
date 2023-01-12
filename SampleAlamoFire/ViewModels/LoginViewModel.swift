//
//  LoginViewModel.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 08/01/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var youremailText: String = ""
    @Published var passwordText: String = ""
    @Published var loginResponse: LoginResponse?
    @Published var isCanLogin = false
    
    func createLogin(request: LoginRequest) {
        ApiService.shared.callCreateLogin(parameters: request.dictionary ?? [:]) { response in
            if response != nil {
                self.isCanLogin = true
            }
        }
            failure: { error in
               print(error)
            }
    }
}
