//
//  UserListViewModel.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var datas : [UserData]?
    
    func getListUser() {
        ApiService.shared.getListUser() { response in
            if let response = response {
                self.datas = response.data
            }
        }
            failure: { error in
               print(error)
            }
    }
}
