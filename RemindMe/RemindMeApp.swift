//
//  RemindMeApp.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-01.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore
// ...


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct YourApp: App {
    //@State var root = roots()
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
          ContentView()
      }
    }
  }
}


