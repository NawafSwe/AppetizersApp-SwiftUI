//
//  User.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation
struct User: Codable {
    var birthday  = Date()
    var firstName = ""
    var lastName  = ""
    var email     = ""
    var extraNapkins = false
    var frequentRefills = false
}
