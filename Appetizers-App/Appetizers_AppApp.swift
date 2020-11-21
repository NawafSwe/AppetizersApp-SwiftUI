//
//  Appetizers_AppApp.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

@main
struct Appetizers_AppApp: App {
    /// init an order to inject it to the main view which is the AppetizerTabView and it will be accessible in all child
    /// that the AppetizerTabView have
    var order = Order()
    var body: some Scene {
        WindowGroup {
            
            AppetizerTabView().environmentObject(order)
        }
    }
}
