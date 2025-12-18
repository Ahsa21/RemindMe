//
//  Models.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//

import Foundation


struct item: Identifiable, Observable, Hashable, Equatable {
    var id = UUID()
    var itemName: String
    var Note: String
    var Date: Date
    var when: String
    
}


enum appRoute: Hashable {
    case StartPage
    case NewReminder(theitem:item?)
    case LoginPage
    case Logout
}
