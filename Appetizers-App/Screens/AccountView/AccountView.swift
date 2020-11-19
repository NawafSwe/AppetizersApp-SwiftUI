//
//  AppetizerHomeView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AccountView: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""
    @State var date :Date = Date()
    @State var extraNap :Bool = false
    @State var frequentRefill :Bool = true
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                        .textContentType(.name)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                       
                    
                    TextField("Last Name", text: $lastName)
                        .textContentType(.familyName)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                       
                    
                    TextField("First Name", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        
                    DatePicker("Birthday", selection: $date,displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .accentColor(.brandPrimary)
                    
                    Button(action:{}){
                        Text("Save Changes")
                            .foregroundColor(.brandPrimary)
                    }
                }
                Section(header:Text("Requests")){
                    Toggle("Extra Napkins", isOn: $extraNap)
                        .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
                    Toggle("Frequent Refills", isOn: $frequentRefill)
                        .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
                }
            }
            .navigationTitle("Account🤪")
        }
    }
}

struct AppetizerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
