//
//  XmarkView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 18/11/2020.
//

import SwiftUI

struct XmarkView: View {
    @Binding var dissmis: Bool
    var body: some View {
        //X mark button to dismiss from current view
        HStack{
            Spacer()
            
            Button(action: {
                //because it is linked to viewModel it will dismiss its self from the sheet because it is published
                self.dissmis = false
            
            }, label: {
                Image(systemName: "xmark")
                    //.label black in white mode and white in dark mode
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    // 44 is a touch target
                    .frame(width:44, height: 44)
            })
            
            
        }
        .padding()
    }
}

struct XmarkView_Previews: PreviewProvider {
    static var previews: some View {
        XmarkView(dissmis: .constant(false))
    }
}
