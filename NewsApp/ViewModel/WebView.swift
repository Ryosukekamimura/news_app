//
//  WebView.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/27.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI


struct webView : UIViewRepresentable{
    
    var url : String
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
        
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
