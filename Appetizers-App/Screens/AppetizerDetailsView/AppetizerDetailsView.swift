//
//  AppetizerDetailsView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 18/11/2020.
//

import SwiftUI

struct AppetizerDetailsView: View {
    @State private var dismiss = false
    let appetizer:Appetizer = MockData.appetizerSample
    var body: some View {
        VStack{
            VStack{
                Image(appetizer.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : 350, height: 290)
                
                
            }.overlay(
                Button(action: {self.dismiss = true }){
                    OverlayXmarkButton(dismiss: $dismiss)
                })
            
            Text("\(appetizer.name)")
                .font(.largeTitle)
                .padding()
            Text("\(appetizer.description)")
                /// making the text if takes up another line goes from center
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            VStack{
                HStack(alignment: .center ,spacing:20 ){
                    AppetizerInfo(title: "calories", info: "\(appetizer.calories)")
                    AppetizerInfo(title: "carbs", info: "\(appetizer.carbs) g")
                    AppetizerInfo(title: "protein", info: "\(appetizer.protein) g")
                }
                .padding()
                
                AddOrderButton(price: "\(appetizer.price)")
                    .padding()
            }
            Spacer()
        }
        .frame(maxWidth:.infinity)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .cornerRadius(4)
        
    }
}

struct AppetizerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailsView()
    }
}

struct OverlayXmarkButton :View{
    @Binding var dismiss:Bool
    var body: some View{
        HStack{
            Spacer()
            VStack{
                
                XmarkView(dissmis: self.$dismiss)
                Spacer()
            }.padding(.vertical,-15)
            
        }
        
    }
}

struct AppetizerInfo:View{
    let title:String
    let info: String
    var body: some View{
        VStack(alignment: .center, spacing:3){
            Text("\(title)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text("\(info)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
        
    }
}

struct AddOrderButton: View{
    let price:String
    var body: some View{
        Button(action:{}){
            Text(" $\(price) - Add To Order")
                .font(.system(size: 20))
                .bold()
        }
        .frame(width: 300, height: 50, alignment: .center)
        .background(Color.brandPrimary)
        .cornerRadius(10)
        .accentColor(.white)
    }
}
