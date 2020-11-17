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
    
    /// function to get fetch appetizers and re set the appetizers list if there are appetizers
    func getAppetizers(){
        NetworkManager.shared.fetchRecipes { (result) in
            DispatchQueue.main.async {
                switch result{
                    case .success(let appetizers):
                        self.appetizers = appetizers
                    case .failure(let error):
                        /// determining which error to display to user
                        switch error{
                            case .invalidData:
                                self.alertItem = AlertContext.invalidData
                                
                            case .invalidResponse:
                                self.alertItem = AlertContext.invalidResponse
                            case .invalidURL :
                                self.alertItem = AlertContext.invalidResponse
                            case .unCompleted:
                                self.alertItem = AlertContext.unCompleted
                        }
                        
                        
                }
                
            }
        }
    }
}
