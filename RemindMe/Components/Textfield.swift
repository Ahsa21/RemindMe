//
//  Textfield.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-01.
//

import SwiftUI

struct Textfield: View {
    @State var text = "text"
    @Binding var input: String
    @State var height: CGFloat = 100
    
    var body: some View {
        VStack{
            HStack{
                Text(text)
                    .fontWeight(.bold)
                    
                Spacer()
            }
            TextField("", text: $input)
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: height)
               // .background(.green)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                
                
        }
        .padding(.horizontal, 20.0)
    }
}




#Preview {
    
    struct test: View {
        @State var Thetest = ""
        var body: some View {
            Textfield(input: $Thetest)
        }
    }
    
    return test()
    
}

