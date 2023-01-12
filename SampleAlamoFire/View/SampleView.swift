//
//  SampleView.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

import Foundation
import SwiftUI

struct SampleView: View {
    
    //Instance for view model
    @ObservedObject var vm = SampleViewModel()
    init(){
        vm.getToken()
        
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World").font(Font.system(size: 30))
        }
    }
}
