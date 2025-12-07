//
//  rootFunctions.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-03.
//

import Foundation
import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import Firebase



@Observable class roots {
    
    let userid = Auth.auth().currentUser?.uid
    
    var ref = Database.database().reference()
    
    func addNote(name:String, note: String, date: Date, when: String) {
        //let TheNote = ref.child("users").child(userid!).child(name)
        let reminderPath = ref.child("users").child(userid!).child("reminders").child(name)
        
        let timestamp = date.timeIntervalSince1970
        
        let reminderData: [String: Any] = [
                    "name": name, // Storing name just for completeness, though it's also the key
                    "note": note,
                    "dateTimestamp": timestamp, // Save as a Double for sorting/retrieval
                    "dateString": ISO8601DateFormatter().string(from: date), // Optional: Save as readable string too,
                    "when": when
                ]
        
        reminderPath.setValue(reminderData) { error, databaseRef in
                    if let error = error {
                        print("🚨 Error saving note '\(name)': \(error.localizedDescription)")
                    } else {
                        print("✅ Note '\(name)' saved successfully.")
                    }
                }
    }
    

    
    
    func signIn() async {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        //GIDSignIn.sharedInstance.configuration = config
        
        
        let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let rootViewController = await scene?.windows.first?.rootViewController
        else {
            fatalError("There is no root view controller!")
        }
        
        
        GIDSignIn.sharedInstance.signIn(
            with: config ,presenting: rootViewController ) {
                user, error in
                
                if let error = error {
                    print("error sign in")
                    return
                }
                guard let user = user else {
                    print("no user returned")
                    return
                }
                guard let idToken = user.authentication.idToken else {
                    //throw AuthenticationError.runtimeError("Unexpected error occurred, please retry")
                    return
                }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.authentication.accessToken)
                Task {
                                do {
                                    let result = try await Auth.auth().signIn(with: credential)
                                    // The line below executes ONLY on successful Firebase sign-in.
                                    print("✅ Firebase Sign-In Successful for user: \(result.user.uid)")
                                    // The ContentView listener will now fire and update isloggedIn = true.
                                } catch {
                                    print("🚨 Firebase Sign-In Error: \(error.localizedDescription)")
                                }
                            }
                    
                    
                    
                }
            }

    }
        // Start the sign in flow!
        
        

    


