//
//  TopBar.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack{
            Text("My List")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.leading)
            
            Spacer()
            
            Button(action:{
                
            }) {
                Text("Edit")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.trailing)
            }
        }
        
        
        
    }
}

#Preview {
    TopBar()
}
