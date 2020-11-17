//
//  ContentView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            
            AppetizerListView()
                .tabItem {
                    VStack{
                Text("Home")
                   
                Image(systemName: "house")
                    
                } }
            
            AccountView()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Account")
                    }
                }
            OrderView()
                .tabItem {
                    VStack{
                        Image(systemName:"bag")
                        Text("Order")
                        
                    }
                }
        }
        //setting the color for each selected tabItem
        /// using the one from the extension
        .accentColor(.brandPrimary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
