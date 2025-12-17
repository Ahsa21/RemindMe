//
//  SwiftUIView.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-17.
//

import SwiftUI

struct Signout: View {
    @State var root = roots()
    var body: some View {
        VStack(){
            Button(action: {
                root.signOut()
            }) {
                Text("Sign out")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 100.0)
            }
                
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.green)
    }
}

#Preview {
    Signout()
}
