//
//  AppetizerAlert.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import Foundation
import SwiftUI

//MARK:- Network Alerts context
struct AlertContext {
    static let invalidURL = AlertItem(message: Text("There was an Issue from the server If This persists Please  Contact Developer")
                                      , dismissButton:.default(Text("OK")),
                                      title:Text("Server Error"))
    
    static let invalidResponse = AlertItem(message: Text("invalid Response From The Server Please Contact Developer"), dismissButton: .default(Text("OK")), title:                                       Text("Network Error"))
    
    
    static let invalidData = AlertItem(message: Text("Invalid Data received from the server please contact the developer"), dismissButton: .default(Text("OK")), title:                              Text("Server Error"))
    
    static let unCompleted = AlertItem(message: Text("Unable to complete Your Request please checkout your network connection"), dismissButton: .default(Text("OK")), title:                              Text("Server Error"))
}
