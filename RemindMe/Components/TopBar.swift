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

    var body: some View {
        HStack {
            Text("My List")
                .font(.title)
                .fontWeight(.bold)

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


