//
//  AppetizerListCell.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizer
    var body: some View {
        HStack(spacing:15){
            HStack {
                Image(appetizer.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:120, height: 100)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading , spacing: 5){
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.light)
                Text("\(  String(format: "%.2f", appetizer.price)  ) $")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            
        }
        
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.appetizerSample)
    }
}
