//
//  SwiftUIView.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-01.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        VStack {
            Image("Reminder")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            VStack{
                Spacer()
                Text("Welcome to Remind me")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("Stay on top of you app, Welcome to your")
                    .fontWeight(.light)
                    .padding(.horizontal, 30.0)
                Text("smart reminder app")
                    .fontWeight(.light)
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 170)
            
            Spacer()
                .frame(height: 30)
            Button(action: {
                
            }) {
                Text("Login med google")
                    .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color(red: 0.172, green: 0.609, blue: 0.346))
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            .padding(.horizontal, 70)
            
            
                

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        
    }
}

#Preview {
    LoginPage()
}
