//
//  AddOrderButton.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- AddOrderButton
struct AppetizerButton: View{
    let price:String
    let title:String
    var body: some View{
        
            Text(" $\(price) - \(title)")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.white)
        .frame(width: 260, height: 50, alignment: .center)
        .background(Color.brandPrimary)
        .cornerRadius(10)
        .accentColor(.white)
    }
}

struct AddOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(price: "39",title: "Test")
    }
}
