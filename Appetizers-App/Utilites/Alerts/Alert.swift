//
//  Alert.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 17/11/2020.
//

import Foundation
import SwiftUI

struct AlertItem :Identifiable{
    var id = UUID()
    let message:Text
    let dismissButton: Alert.Button
    let title:Text
}
