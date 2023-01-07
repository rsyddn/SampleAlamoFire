//
//  SampleAlamoFireApp.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//
import SwiftUI

@main
struct SampleAlamoFireApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
