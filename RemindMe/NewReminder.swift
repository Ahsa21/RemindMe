//
//  NewReminder.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-01.
//

import SwiftUI

struct NewReminder: View {
    @State var setAlways = false
    @State var setDate = false
    var body: some View {
        VStack{
            Text("New Reminder")
                .font(.title)
                .fontWeight(.bold)
            //Spacer()
            
            Textfield(text: "Name", height: 50)
                .padding(.top)
            Textfield(text: "Note", height: 150)
                .padding(.top)
            HStack{
                Textfield(text: "Name", height: 50)
                VStack{
                    Spacer()
                        .frame(height: 35)
                    Image("Plus")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 45)
                }
                //.background(.red)
            }
            .padding([.top, .trailing])
            
            HStack{
                if !setDate {
                    Button(action: {
                        setAlways = !setAlways
                    }) {
                        Text("Always")
                            .fontWeight(.bold)
                            .frame(maxWidth: 100, maxHeight: 50)
                            .background(Color(red: 0.172, green: 0.609, blue: 0.346))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                
                if !setAlways && !setDate {
                    Spacer()
                }
                
                
                if !setAlways {
                    
                    
                    Button(action: {
                        setDate = !setDate
                    }) {
                        Text("Set date")
                            .fontWeight(.bold)
                            .frame(maxWidth: 100, maxHeight: 50)
                            .background(Color(red: 0.168, green: 0.589, blue: 0.334))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                
            }
            .padding(.all, 50)
            
            Button(action: {}) {
                Text("Done")
                    .fontWeight(.bold)
                    .frame(maxWidth: 100, maxHeight: 50)
                    .background(Color(red: 0.168, green: 0.589, blue: 0.334))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    NewReminder()
}


