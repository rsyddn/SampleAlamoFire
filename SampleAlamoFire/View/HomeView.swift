//
//  UserCardView.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import SwiftUI


struct HomeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: UserView()){
                    Text("Get Single User")
                }
                NavigationLink(destination: UserListView()){
                    Text("Get List User")
                }
            }
        }
    }
}

