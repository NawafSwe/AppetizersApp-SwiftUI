//
//  AccountViewModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI
final class AccountViewModel : ObservableObject{
    /// giving an app storage object called user of optional data `when app deleted user default will be deleted`
    /// `no sensitive data in userDefaults!!! such password or credit card..`
    @AppStorage("user") private var userData:Data?
    @Published var user = User()
    @Published var alertItem : AlertItem?
    
    func saveChanges()  -> Void{
        guard isValidForm else{
            return
        }
        /// save changes by functions like saving to userDefaults or to server or both
        let encoder = JSONEncoder()
        do{
            /// encoding `user data` to save it to userDefaults
            let encodedData = try encoder.encode(self.user)
            userData = encodedData
            alertItem = AlertContext.savedSuccessfully
        }catch _ {
            alertItem = AlertContext.unAbelToSaveUserData
            return
        }
        
    }
    
    
    func getUser()->Void{
        let decoder = JSONDecoder()
        guard let userData = userData else {return }
        do{
            /// setting user data
            user = try decoder.decode(User.self, from: userData )
        }catch _ {
            alertItem = AlertContext.unAbelToGetUserData
            return
        }
    }
    
    
    var isValidForm:Bool {
        /// check if first name and email and last name are not empty strings
        guard !user.firstName.isEmpty && !user.email.isEmpty && !user.lastName.isEmpty else {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.fieldCannotBeEmpty
            }
            
            return false
            
        }
        /// checking validity of email
        guard user.email.isValidEmail  else {
            DispatchQueue.main.async {
                self.alertItem =  AlertContext.invalidEmail
            }
            return false
        }
        
        /// passed all tests
        return true
    }
    
}
