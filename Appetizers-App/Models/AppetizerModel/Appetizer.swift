//
//  RecipeModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation

 //MARK:- AppetizerResponse  Model:Codable
struct AppetizerResponse : Codable{
    let request: [Appetizer]
}
 //MARK:- Appetizer Model:Codable
struct Appetizer: Codable, Identifiable{
    let id: Int
    let calories: Int
    let imageURL: String
    let description: String
    let carbs: Int
    let protein: Int
    let price: Float
    let name:String
}

 //MARK:- MockData Model
struct MockData {
    static let appetizerSample = Appetizer(id: 800, calories: 450, imageURL: "asian-flank-steak", description: "This perfectly thin cut just melts in your mouth.", carbs: 400, protein: 300, price: 8.5, name: "Appetizer")
    
    static let appetizerList = [
        Appetizer(id: 800, calories: 450, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg", description: "These won't last 10 seconds once they hit the table.", carbs: 320, protein: 39, price: 31 , name: "Appetizer"),
        
        Appetizer(id: 350, calories: 300, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg", description: "easoned shrimp from the depths of the Atlantic Ocean.", carbs: 320, protein: 329, price: 10 , name: "Appetizer"),
        
        Appetizer(id: 350, calories: 300, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/philly-cheesesteak-sliders.jpg", description: "These look incredible. That's it. That's the description.", carbs: 320, protein: 329, price: 10 , name: "Appetizer"),
        
        Appetizer(id: 350, calories: 300, imageURL:"https://seanallen-course-backend.herokuapp.com/images/appetizers/rainbow-spring-rolls.jpg", description: "How did these even make the menu???" , carbs: 320, protein: 329, price: 10 , name: "Appetizer"),
        
        Appetizer(id: 350, calories: 300, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/stuff-shells.jpg", description:"I'm getting hungrier just looking at these." , carbs: 320, protein: 329, price: 10 , name: "Appetizer")
        
    ]
    static let repeatedList  = [appetizerSample, appetizerSample, appetizerSample, appetizerSample]
}
