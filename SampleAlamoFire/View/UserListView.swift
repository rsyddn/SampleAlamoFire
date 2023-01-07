//
//  UserCardView.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import SwiftUI


struct UserListView: View {
    @ObservedObject var vm = UserListViewModel()
    
    init(){
        vm.getListUser()
    }
    var body: some View {
        VStack{
            List(vm.datas!){ data in
                CardView(firstName: data.firstName, lastName: data.lastName, email: data.email)
            }
        }
    }
}

struct CardView: View {
    
    var firstName: String
    var lastName: String
    var email: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(firstName)
            Text(lastName)
            Text(email)
        }
    }
}
