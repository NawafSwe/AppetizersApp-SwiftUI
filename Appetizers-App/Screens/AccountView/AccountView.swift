//
//  AppetizerHomeView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView{
            Text("AccountView")
            .navigationTitle("Account View 💁")
        }
    }
}

struct AppetizerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
