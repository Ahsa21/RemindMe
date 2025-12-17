//
//  ContentView.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-01.
//

import SwiftUI
import FirebaseAuth



struct ContentView: View {
    @State var isloggedIn: Bool?
    @State private var paths = NavigationPath()

    var body: some View {
        NavigationStack(path: $paths) {   // <<< IMPORTANT
            VStack {
                if isloggedIn == true {
                    StartPage(paths: $paths)
                } else if isloggedIn == false {
                    LoginPage()
                }
            }
            .navigationDestination(for: appRoute.self) { route in
                switch route {
                case .StartPage:
                    StartPage(paths: $paths)

                case .LoginPage:
                    LoginPage()

                case .NewReminder(let item):
                    NewReminder(Item: item)
                    
                case .Logout:
                    Signout()
                }
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                isloggedIn = (user != nil)
            }
        }
    }
}
