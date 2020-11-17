//
//  AppetizerListViewModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel : ObservableObject{
    @Published  var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading:Bool = true
    
    /// `function` to get fetch appetizers and re set the appetizers list if there are appetizers.
    ///`[self]` can be used to avoid re-typing self inside the closure incase no naming match.
    func getAppetizers(){
        /// run after 1.5 s to show `animation`
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            NetworkManager.shared.fetchRecipes { [self] (result) in
                DispatchQueue.main.async {
                    //stop animating after `3 seconds`
                    self.isLoading = false
                    switch result{
                        case .success(let appetizers):
                            self.appetizers = appetizers
                        case .failure(let error):
                            /// determining which error to display to user
                            switch error{
                                case .invalidData:
                                    alertItem = AlertContext.invalidData
                                    
                                case .invalidResponse:
                                    alertItem = AlertContext.invalidResponse
                                case .invalidURL :
                                    alertItem = AlertContext.invalidResponse
                                case .unCompleted:
                                    alertItem = AlertContext.unCompleted
                            }
                            
                            
                    }
                    
                }
            }
        }
        
        
    }
}
