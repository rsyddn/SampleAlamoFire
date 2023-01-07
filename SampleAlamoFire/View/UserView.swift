//
//  UserCardView.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import SwiftUI


struct UserView: View {
    
    //Instance for view model
    @ObservedObject var vm = UserViewModel()
    init(){
        vm.getUser()
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("First Name").font(Font.system(size: 30))
                Text(vm.data?.firstName ?? "Error: Failed Get First Name").font(Font.system(size: 30))
            }
            HStack{
                Text("Last Name").font(Font.system(size: 30))
                Text(vm.data?.lastName ?? "Error: Failed Get Last Name").font(Font.system(size: 30))
            }
            HStack{
                Text("Email").font(Font.system(size: 30))
                Text(vm.data?.email ?? "Error: Failed Get Email").font(Font.system(size: 30))
            }
        }
    }
}

