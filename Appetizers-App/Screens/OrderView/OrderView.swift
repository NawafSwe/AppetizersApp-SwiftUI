//
//  OrderView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orders: Order
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing:20){
                    List {
                        ForEach(orders.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                            
                        }.onDelete(perform: orders.removeOrder)
                    }
                    .listStyle(PlainListStyle())
                    Button(action:{}){
                        AppetizerButton(price: "\(orders.allPrice)", title: "Place Order")
                        
                        
                    }
                    .padding(.bottom,30)
                }
                
                if orders.items.isEmpty{
                    EmptyState()
                    
                    
                }
                
            }
            .navigationTitle("Order List 🫀")
        }
    }
    
}
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}


