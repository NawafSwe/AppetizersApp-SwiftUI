//
//  AppetizerListView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject private var viewModel   = AppetizerListViewModel()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .onAppear{
                viewModel.getAppetizers()
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
