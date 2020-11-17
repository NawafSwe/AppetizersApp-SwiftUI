//
//  getApetizers.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 16/11/2020.
//

import Foundation
import UIKit
//singleton concept
final class NetworkManager {
    static let baseURL:String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL:String = baseURL + "appetizers"
    static let shared = NetworkManager()
    private init(){}
    
    /// we are passing the each pair key `<NSString,UIImage>`
    /// `caching images` we want to cache images to avoid downloading images every time `NSString` is the identifier
    /// and the `UIImage`  is the value of the image
    private let cache = NSCache<NSString,UIImage>()
    
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
                //print("error response")
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
    
    /// downloading images from server
    /// the reason that we do not want to return result or error because we do not need to if there is no image then we will have a place holder
    func downloadImages(from url:String , completion: @escaping (UIImage?)->Void ){
        /// first before making `Network call` we want to check if we have the image in the cache or not
        /// `url` is the image key
        let cacheKey = NSString(string: url)
        /// checking now if the image == `nil` then it is not in the cache so continue and do a network call
        /// to get it otherwise return because we have it in the cache
        if let image = self.cache.object(forKey: cacheKey){
            /// returning cached image
            completion(image)
            return
        }
        
        /// checking the url is valid url
        guard let safeUrl = URL(string:url) else {
            /// no image because the url is not valid
            completion(nil)
            return
        }
        
        /// url valid then we will do a network call to get the image from the server
        
        let task = URLSession.shared.dataTask(with: safeUrl) { (data, response, error) in
            /// we do not care here for error or response status because we do not have alerts and such error handling
            /// if there is an error or problem just place a placeholder image
            guard let data = data ,let image = UIImage(data: data) else{
                completion(nil)
                return
            }
            /// after getting the image safely then put it in the cache
            /// `image` is the image , `cacheKey` is the cache key of the image
            self.cache.setObject(image, forKey: cacheKey)
            /// return the image
            completion(image)
            return
        }
        /// starting the network call
        task.resume()
    }
}
