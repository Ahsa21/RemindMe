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
    //@State var root: roots
    var body: some View {
        VStack {
            if isloggedIn == true {
                NewReminder()
            }
            if isloggedIn == false {
                LoginPage()
            }
        }
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user == nil {
                    isloggedIn = false
                } else {
                    isloggedIn = true
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}

