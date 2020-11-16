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
        }.onAppear{
            NetworkManager().fetchRecipes { (result) in
                switch result{
                    case .success(let recipes):
                        print(recipes)
                    case .failure(let err):
                        print(err)
                }
                
            }
        }
       
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
