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
              AppetizerListCell(appetizer: appetizer)
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
