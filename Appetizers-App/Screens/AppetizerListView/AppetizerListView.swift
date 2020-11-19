//
//  AppetizerListView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import SwiftUI
struct AppetizerListView: View {
    /// using state object if you init viewModel to this view but if you receiving a state object from another view to this view you `Must` use `@ObservedObject`.
    /// down in` IOS 13`
    /// `@StateObject` is not supported so you have to use `@ObservedObject`
    @StateObject private var viewModel   = AppetizerListViewModel()
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture{
                            /// setting an appetizer
                            DispatchQueue.main.async {
                                viewModel.selectedAppetizer = appetizer
                            }
                        }
                }
                ///disable the list to prevent user to scroll while showing details
                .disabled(viewModel.showDetails)
                
                .onAppear{
                    viewModel.getAppetizers()
                }
                .navigationTitle("Appetizer List 🍟")
                .navigationViewStyle(StackNavigationViewStyle())
            }
            /// if user selected an appetizer then we wants a nice shadow and blur view
            .blur(radius: viewModel.showDetails ? 5 : 0)
            .shadow(radius: viewModel.showDetails ? 10 : 0 )
            
            
            /// if user tapped on a cell show details about appetizer 
            if(viewModel.showDetails){
                
                AppetizerDetailsView(dissmiss: $viewModel.showDetails ,appetizer: viewModel.selectedAppetizer!)
                    /// making animation
                    .transition(.identity)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.3))
            }
            if viewModel.isLoading{
                LoadingView(style: .large, color: UIColor.brandPrimary)
            }
        }.alert(item: $viewModel.alertItem){ alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            
            
            
        }
    }
    struct AppetizerListView_Previews: PreviewProvider {
        static var previews: some View {
            AppetizerListView()
        }
    }
}
