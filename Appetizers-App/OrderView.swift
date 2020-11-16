//
//  OrderView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Order View!")
                .navigationTitle("Order List 🫀")
        }
       
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
