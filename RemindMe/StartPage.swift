//
//  StartPage.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//

import SwiftUI

struct StartPage: View {
    @State var root = roots()   // Observable class
    
    
    @Binding var paths : NavigationPath

    var body: some View {
        VStack {
            TopBar()
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(root.personLi.keys.sorted(), id: \.self) { key in
                        Button {
                            if let theItem = root.personLi[key] {
                                paths.append(appRoute.NewReminder(theitem: theItem))
                            }
                        } label: {
                            BottonStyle(name: key)
                        }
                        .contentShape(Rectangle())   // full area tappable
                    }
                }
                .padding(.vertical)
            }
        }
        .task {
            // Load automatically when page opens
            
            await root.loadData()
        }
    }
}

#Preview {
    StartPage(paths: .constant(NavigationPath()))
}
