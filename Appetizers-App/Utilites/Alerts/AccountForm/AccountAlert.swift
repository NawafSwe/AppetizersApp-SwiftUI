//
//  AccountAlertItem.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import Foundation
import SwiftUI

//MARK:- Account Alert Form
extension AlertContext  {
    static let invalidEmail = AlertItem(message: Text("Email must be valid Email Format."), dismissButton: .default(Text("Got It!.")),
                                        title: Text("Form Error"))
    static let fieldCannotBeEmpty =  AlertItem(message: Text("Fields Must All be filled with first name, last name , email cannot be empty fields"), dismissButton: .default(Text("Got It!")),
                                               title: Text("Form Error"))
    
    static let savedSuccessfully = AlertItem(message: Text("Your Data Saved Successfully"), dismissButton: .default(Text("OK")), title: Text("Account Update"))
    
    static let unAbelToGetUserData = AlertItem(message: Text("Your Data cannot be loaded if the problem persist please contact the developer"), dismissButton: .default(Text("Got It")), title: Text("Account Error"))
    
    static let unAbelToSaveUserData = AlertItem(message: Text("Your Data cannot be Saved if the problem persist please contact the developer"), dismissButton: .default(Text("Got It")), title: Text("Account Error"))
}
