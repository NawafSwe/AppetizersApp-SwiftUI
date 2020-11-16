//
//  AppetizerListView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.repeatedList){ appetizer in
                HStack(spacing:30){
                    Image(appetizer.imageURL)
                        .resizable()
                        .frame(width:100, height: 100)
                        
                        
                    VStack{
                        Text(appetizer.name)
                        Text("\(  String(format: "%.2f", appetizer.price)  ) $")
                    }
                }
            }
                .navigationTitle("Appetizer List 🍟")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
