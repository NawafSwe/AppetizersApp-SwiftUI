//
//  RecipeModel.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation

 //MARK:- Request
struct Request : Codable{
    let request: [RecipeModel]
}
 //MARK:- Recipe Model:Codable
struct RecipeModel: Codable{
    let id: Int
    let calories: Int
    let carbs: Int
    let protein: Int
    let price: Float
    let imageURL: String
    let description: String
}
