//
//  OverlayXmarkButton.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- OverlayXmarkButton
struct OverlayXmarkButton : View {
    @Binding var dismiss: Bool
    var body: some View{
        Button(action:{
            self.dismiss = false
        }){
            ZStack{
                Circle()
                    .frame(width:30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                XmarkView()
                
            }
        }
        
    }
    
}
struct OverlayXmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        OverlayXmarkButton(dismiss: .constant(false))
    }
}
