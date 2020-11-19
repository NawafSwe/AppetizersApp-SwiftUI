//
//  String+Ext.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import Foundation
/// extension on string to check if its valid email or not
extension String {
    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
