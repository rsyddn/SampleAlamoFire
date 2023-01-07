//
//  LoginView.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 08/01/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    //Instance for view model
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("User Login")
                    .font(Font.system(size: 30))
                
                //Email field
                TextField("Email", text: $vm.youremailText)
                    .font(Font.system(size: 15))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    ).padding()
                
                //Password field
                SecureField("Password", text: $vm.passwordText)
                    .font(Font.system(size: 15))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    ).padding()
                
                //Sign In Button
                NavigationLink(destination: HomeView(),isActive: $vm.isCanLogin){
                    Button("SignIn", action: {
                        let request = LoginRequest(email: vm.youremailText, password: vm.passwordText)
                        vm.createLogin(request: request)
                    })
                }
            }
        }
    }
    
    func canLogin(){
        
    }
}
