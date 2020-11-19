//
//  AppetizerHomeView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                
                Section(header:Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.firstName)
                        .textContentType(.name)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        /// dispaling autocorrection
                        .disableAutocorrection(true)
                    
                    
                    TextField("Last Name", text: $viewModel.lastName)
                        .textContentType(.familyName)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    TextField("First Name", text: $viewModel.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.date,displayedComponents: .date)
                        .accentColor(.brandPrimary)
                    
                    
                    Button(action:{}){
                        Text("Save Changes")
                            .foregroundColor(.brandPrimary)
                    }
                }
                Section(header:Text("Requests")){
                    Toggle(isOn: $viewModel.extraNap){
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.frequentRefill){
                        Text("Frequent Refills")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
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
