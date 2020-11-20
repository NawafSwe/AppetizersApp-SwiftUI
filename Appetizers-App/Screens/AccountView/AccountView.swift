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
                    TextField("First Name", text: $viewModel.user.firstName)
                        .textContentType(.name)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        /// dispaling autocorrection
                        .disableAutocorrection(true)
                    
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .textContentType(.familyName)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    TextField("Email", text: $viewModel.user.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday ,displayedComponents: .date)
                        .accentColor(.brandPrimary)
                    
                    
                    Button(action:{
                        viewModel.saveChanges()
                    }){
                        Text("Save Changes")
                            .foregroundColor(.brandPrimary)
                    }
                }
                Section(header:Text("Requests")){
                    Toggle(isOn: $viewModel.user.extraNapkins){
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.user.frequentRefills){
                        Text("Frequent Refills")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
            }
            .alert(item: $viewModel.alertItem){ alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
            .onAppear{
                /// getting user data if the view appears 
                viewModel.getUser()
            }
            .navigationTitle("🤪 Account")
        }
    }
}
struct AppetizerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
