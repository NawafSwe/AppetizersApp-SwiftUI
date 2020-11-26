//
//  Date-Ext.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 26/11/2020.
//

import Foundation
extension Date{
    var eighteenYearsAgo:Date {
        /// setting that the Calendar on the date component will be from to day till 18 years ago
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        
    }
    var hundredOneYearsAgo:Date {
        /// getting date from now till 101
        Calendar.current.date(byAdding: .year, value: -101, to: Date())!
    }
}
