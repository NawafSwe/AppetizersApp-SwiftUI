//
//  AddOrderButton.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- AddOrderButton
struct AddOrderButton: View{
    let price:String
    var body: some View{
        Button(action:{}){
            Text(" $\(price) - Add To Order")
                .font(.system(size: 20))
                .bold()
        }
        .frame(width: 260, height: 50, alignment: .center)
        .background(Color.brandPrimary)
        .cornerRadius(10)
        .accentColor(.white)
    }
}

struct AddOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderButton(price: "39")
    }
}
