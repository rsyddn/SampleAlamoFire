//
//  UserViewModel.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var data : UserData?
    
    func getUser() {
        ApiService.shared.getUser() { response in
            if let response = response {
                self.data = response.data
            }
        }
            failure: { error in
               print(error)
            }
    }
}
