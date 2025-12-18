//
//  TopBar.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//

import SwiftUI

struct TopBar: View {

    @Binding var isEditing: Bool
    let onRemove: () -> Void
    @Binding var path: NavigationPath

    var body: some View {
        HStack {
            Button(action: {
                path.append(appRoute.Logout)
            }) {
                Text("account")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    
                
            }

            Spacer()

            if isEditing {
                Button("Remove") {
                    onRemove()
                }
                .foregroundColor(.red)
                .padding(.trailing)
            }

            Button(isEditing ? "Done" : "Edit") {
                isEditing.toggle()
            }
            .fontWeight(.bold)
        }
        .padding()
    }
}



