//
//  AppetizerDetailsView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 18/11/2020.
//

import SwiftUI

//MARK:- AppetizerDetailsView
struct AppetizerDetailsView: View {
    @Binding var dissmiss: Bool
    var appetizer:Appetizer
    var body: some View {
        VStack{
            AppetizerRemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height: 225)
            
            AppetizerDescription(name: appetizer.name, description: appetizer.description)
            
            VStack{
                HStack(alignment: .center ,spacing:40 ){
                    AppetizerInfo(title: "Calories", info: "\(appetizer.calories)")
                    AppetizerInfo(title: "Carbs", info: "\(appetizer.carbs) g")
                    AppetizerInfo(title: "Protein", info: "\(appetizer.protein) g")
                }
                .padding()
            }
            Spacer()
            
            AddOrderButton(price: "\(appetizer.price)")
                .padding(.bottom,30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( OverlayXmarkButton(dismiss: $dissmiss) ,alignment: .topTrailing)
        
        
        
    }
}
//MARK:- AppetizerDetailsView_Previews
struct AppetizerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailsView(dissmiss: .constant(false), appetizer: MockData.appetizerSample)
    }
}



//MARK:- AppetizerInfo
struct AppetizerInfo: View{
    let title:String
    let info: String
    var body: some View{
        VStack(alignment: .center, spacing:3){
            Text("\(title)")
                .bold()
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(info)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

//MARK:- AppetizerDescription
struct AppetizerDescription: View {
    let name : String
    let description:String
    var body: some View {
        VStack{
            Text("\(name)")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("\(description)")
                /// making the text if takes up another line goes from center
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
        }
    }
}
