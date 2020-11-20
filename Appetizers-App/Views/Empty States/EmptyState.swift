//
//  EmptyStates.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct EmptyState: View{
    var body: some View{
        
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:40){
                Image("noOrders")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200,height: 60)
                
                Text("No Items Yet In Your Orders")
                    .font(.body)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                
            }
        }
    }
}
struct EmptyStates_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
