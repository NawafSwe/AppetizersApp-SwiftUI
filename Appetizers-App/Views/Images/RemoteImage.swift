//
//  RemoteImage.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 17/11/2020.
//

import SwiftUI

//MARK:- ImageLoader
final class ImageLoader : ObservableObject{
    
    @Published var image: Image? = nil
    func load(from url:String){
        NetworkManager.shared.downloadImages(from: url) { (UIImage) in
            /// checking if there is image
            guard let safeImage = UIImage else { return }
            DispatchQueue.main.async {
                /// init the image using ui image
                self.image = Image(uiImage: safeImage)
            }
        }
    }
}

//MARK:- RemoteImage
struct RemoteImage:View{
    var image : Image?
    var body: some View{
        /// Checking if the image is exist if not show the place holder
        image?.resizable() ?? Image("NotFoundImage").resizable()
    }
}
//MARK:- AppetizerRemoteImage
struct AppetizerRemoteImage :View{
    /// listing for changes to change the image itself
    @StateObject private var image : ImageLoader = ImageLoader()
    let url : String
    var body: some View{
        /// this will be used in the ui where will get the complete image removing all logic from the view
        RemoteImage(image: image.image)
            /// trigger the network call
            .onAppear{
                image.load(from: url)
            }
    }
}
