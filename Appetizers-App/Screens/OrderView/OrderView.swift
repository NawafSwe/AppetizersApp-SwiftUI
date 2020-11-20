//
//  OrderView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct OrderView: View {
    @State var orderList : [Appetizer] = []
    @State var fakeData = MockData.appetizerList
    var allPrice : Double{
        var prices = 0.0
        for order in fakeData{
            prices  += order.price
        }
        return prices
    }
    var body: some View {
        
        NavigationView {
            if fakeData.count > 0{
                VStack(spacing:20){
                    List {
                        ForEach(MockData.appetizerList){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                            
                        }.onDelete(perform: { indexSet in
                            /// deleting element from order list
                            fakeData.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    Button(action:{}){
                        AppetizerButton(price: "\(allPrice)", title: "Place Order")
                        
                        
                    }
                    .padding(.bottom,10)
                }
                .navigationTitle("Order List 🫀")
            }else{
                EmptyOrder()
                    .navigationTitle("Order List 🫀")
            }
            
            
            
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

struct EmptyOrder: View{
    var body: some View{
        VStack(spacing:40){
            Image("NotFoundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200,height: 60)
            
            Text("No Orders Yet")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            
        }
    }
}
