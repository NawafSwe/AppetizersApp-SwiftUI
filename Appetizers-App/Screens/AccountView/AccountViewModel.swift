//
//  AccountViewModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI
final class AccountViewModel : ObservableObject{
    @Published var firstName = ""
    @Published var lastName  = ""
    @Published var email   = ""
    @Published var date  = Date()
    @Published var extraNap  = false
    @Published var frequentRefill = false
    @Published var alertItem : AlertItem?
    var isValidForm:Bool {
        
        /// check if first name and email and last name are not empty strings
        guard !firstName.isEmpty && !email.isEmpty && !lastName.isEmpty else {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.fieldCannotBeEmpty
            }
            
            return false
            
        }
        /// checking validity of email
        guard email.isValidEmail  else {
            DispatchQueue.main.async {
                self.alertItem =  AlertContext.invalidEmail
            }
            return false
        }
        
        /// passed all tests
        return true
    }
    
    func saveChanges()  -> Void{
        guard isValidForm else{
            return
        }
        /// save changes by functions like saving to userDefaults or to server
        
    }
}
