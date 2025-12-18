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
    @State var Theroot : roots = roots()
    @State var Item: item? = nil
    
    @State var NoteName: String = "f"
    @State var Note: String = ""
    @State var date: Date = Date()
    
    @State var when: String? = nil
    var body: some View {
        VStack{
            
            Text("New Reminder")
                .font(.title)
                .fontWeight(.bold)
            //Spacer()
            
            Textfield(text: "Name", input: $NoteName, height: 50)
                .padding(.top)
            Textfield(text: "Note", input: $Note, height: 150)
                .padding(.top)
            HStack{
                if setDate {
                    DatePicker(
                        "Remind Me On",
                        selection: $date, // Binds the selection
                        displayedComponents: [.date, .hourAndMinute] // Shows both date and time
                    )
                    .datePickerStyle(.compact) // Use the compact style (small clickable label)
                    .padding()
                } else if setAlways {
                    DatePicker(
                        "Remind Me On",
                        selection: $date, // Binds the selection
                        displayedComponents: [.hourAndMinute] // Shows both date and time
                    )
                    .datePickerStyle(.compact) // Use the compact style (small clickable label)
                    .padding()
                }

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
                        Text("daily")
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
                      //  Theroot.add()
                        setDate = !setDate
                        
                    }) {
                        Text("once")
                            .fontWeight(.bold)
                            .frame(maxWidth: 100, maxHeight: 50)
                            .background(Color(red: 0.168, green: 0.589, blue: 0.334))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                
            }
            .padding(.all, 50)
            
            Button(action: {
                if NoteName.isEmpty || Note.isEmpty {
                    print("something is missing")
                    return
                }
                
                if setAlways {
                    when = "daily"
                } else if setDate {
                    when = "once"
                }
                Theroot.addNote(name: NoteName, note: Note, date: date, when: when!)
            }) {
                Text("Done")
                    .fontWeight(.bold)
                    .frame(maxWidth: 100, maxHeight: 50)
                    .background(Color(red: 0.168, green: 0.589, blue: 0.334))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .task{
            if Item != nil {
                NoteName = Item!.itemName
                Note = Item!.Note
                date = Item!.Date
                when = Item!.when
                
                if Item!.when == "daily" {
                        setAlways = true
                        setDate = false
                } else if Item!.when == "once" {
                        setDate = true
                        setAlways = false
                    }
                
            }
        }
    }
}

#Preview {
    NewReminder(Theroot: roots(), Item: item(itemName: "", Note: "", Date: Date(), when: "daily"))
}


