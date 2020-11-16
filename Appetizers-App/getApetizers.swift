//
//  getApetizers.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation
struct NetworkManager {
    let validUrl:String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    func fetchRecipes(completion: @escaping (Result <[Appetizer],RecipeError> )-> Void) {
        let url:URL = URL(string: self.validUrl)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.error))
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                print("error response")
                completion(.failure(.error))
                return
            }
            guard let safeData = data else {
                completion(.failure(.error))
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let parsedData = try decoder.decode(AppetizerResponse.self, from: safeData)
                let recipesArray = parsedData.request
                completion(.success(recipesArray))
            }catch let error {
                print("\(error)")
                completion(.failure(.error))
                return
            }
        }
        
        task.resume()
        
    }
}
