//
//  Order.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
import SwiftUI
final class Order:ObservableObject{
    @Published var items : [Appetizer] = []
    
    /// one way
    var allPrice : Double{
        var prices = 0.0
        for order in items{
            prices  += order.price
        }
        return prices
    }
    /// other way
    var totalPrice:Double{
        items.reduce(0){$0 + $1.price}
    }
    
    func add(_ appetizer:Appetizer){
        items.append(appetizer)
    }
    
    
    /// removing item
    func removeOrder(at atOffsets: IndexSet){
        items.remove(atOffsets: atOffsets)
    }
}


