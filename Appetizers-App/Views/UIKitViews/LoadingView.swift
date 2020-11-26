//
//  LoadingView.swift
//  Appetizers-App
//
//  Created by Nawaf B Al sharqi on 17/11/2020.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    typealias UIViewType = UIActivityIndicatorView
    /// to customize it across all views.
    let style : UIActivityIndicatorView.Style
    let color: UIColor
    /// `makeUIView` replaces the body in swiftUI struct with a view.
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: self.style)
        activityIndicatorView.color = self.color
        /// start the animating after creation
        activityIndicatorView.startAnimating()
        
        /// returning the view
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
    
    
    
}

struct LoadingView: View{
    let style : UIActivityIndicatorView.Style
    let color: UIColor!
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            //ActivityIndicator(style: style, color: self.color)
            //built in ios14
            ///you can add title string to make text
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
        }
        
    }
}



