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
    
    var personLi : [String: item] = [:]
    
    
    func loadData() async {
        do {
            guard let userid = userid else { return }

            let data = try await ref
                .child("users")
                .child(userid)
                .child("reminders")
                .getData()

            for case let snap as DataSnapshot in data.children {

                let id = snap.key   // auto-generated reminder ID

                let name = snap.childSnapshot(forPath: "name").value as? String ?? ""
                let note = snap.childSnapshot(forPath: "note").value as? String ?? ""
                let timestamp = snap.childSnapshot(forPath: "dateTimestamp").value as? TimeInterval ?? 0
                let when = snap.childSnapshot(forPath: "when").value as? String ?? ""

                personLi[id] = item(
                    //id: id,                       // 👈 important for edit/delete
                    itemName: name,
                    Note: note,
                    Date: Date(timeIntervalSince1970: timestamp)
                    //when: when
                )
            }

            print(personLi)

        } catch {
            print("❌ Error loading data:", error.localizedDescription)
        }
    }

    
    func RemoveNote(noteId: String) {
        ref
            .child("users")
            .child(userid!)
            .child("reminders")
            .child(noteId)
            .removeValue()
    }
    
    func addNote(name: String, note: String, date: Date, when: String) {

        guard let userid = userid else { return }

        let reminderRef = ref
            .child("users")
            .child(userid)
            .child("reminders")
            .childByAutoId()   // ONLY autoId here

        let reminderData: [String: Any] = [
            "name": name,
            "note": note,
            "dateTimestamp": date.timeIntervalSince1970,
            "dateString": ISO8601DateFormatter().string(from: date),
            "when": when
        ]

        reminderRef.setValue(reminderData) { error, _ in
            if let error = error {
                print("🚨 Error saving reminder: \(error.localizedDescription)")
            } else {
                print("✅ Reminder saved successfully.")
            }
        }
    }

    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("failed to Sign Out")
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
        
        

    


