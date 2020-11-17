//
//  AppetizerListView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI
struct AppetizerListView: View {
    /// using state object if you init viewModel to this view but if you receiving a state object from another view to this view you `Must` use `@ObservedObject`.
    @StateObject private var viewModel   = AppetizerListViewModel()
    
    
  
    var body: some View {
        ZStack{
            
                NavigationView {
                    List(viewModel.appetizers){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onAppear{
                        viewModel.getAppetizers()
                    }
                    .navigationTitle("Appetizer List 🍟")
                }.alert(item: $viewModel.alertItem){ alert in
                    Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
                }
            
            if viewModel.isLoading{
                LoadingView(style: .large, color: UIColor.brandPrimary)
            }
        }
     
    }
}
struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
