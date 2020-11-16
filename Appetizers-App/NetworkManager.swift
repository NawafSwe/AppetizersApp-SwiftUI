//
//  getApetizers.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation
//singleton concept
final class NetworkManager {
   static let baseURL:String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL:String = baseURL + "appetizers"
    static let shared = NetworkManager()
    private init(){}
    
    /**  fetchRecipes: function to get recipes from the api
       - returns  `Result<[Appetizer] , APError>`  returns array of appetizers or an error of there is an error
       - Throws throws an error if  the parsing went wrong
     */
     func fetchRecipes(completion: @escaping (Result <[Appetizer],APError> )-> Void) {
        /// checking if the url is valid url if not return with invalidURL error
        guard let url: URL = URL(string: appetizerURL) else {
            completion(.failure(.invalidURL))
            return
        }
        /// creating the session with default config
        let session = URLSession(configuration: .default)
        /// initing the task runner with the url
        let task = session.dataTask(with: url) { (data, response, error) in
            /// checking if error nil or not if not nil return with error unCompleted
            if  let _ = error {
                completion(.failure(.unCompleted))
                return
            }
            /// checking the status code of the response if not 200 or nil return with invalidResponse error
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                print("error response")
                completion(.failure(.invalidResponse))
                return
            }
            /// checking if we get data or not if not valid return with error invalidData
            guard let safeData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            /// decoder to decode json data from a response
            let decoder = JSONDecoder()
            /// trying to decode data if fail return with error invalidData if success returns with the appetizers list
            do{
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: safeData)
                let appetizersList = decodedResponse.request
                completion(.success(appetizersList))
            }catch  _ {
               //print("\(_)")
                completion(.failure(.invalidData))
                return
            }
        }
        /// starts the task
        task.resume()
        
    }
}
