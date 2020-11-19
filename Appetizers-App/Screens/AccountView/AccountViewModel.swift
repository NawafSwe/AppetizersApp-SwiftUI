//
//  AccountViewModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import Foundation
final class AccountViewModel : ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var date : Date = Date()
    @Published var extraNap  = false
    @Published var frequentRefill  = true
    
    
}
