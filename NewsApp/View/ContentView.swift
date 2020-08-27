//
//  ContentView.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/26.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit


struct ContentView: View {
    
    @ObservedObject var list = getData()
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(list.newsdatas, id:\.self){ article in
                    NavigationLink(destination: webView(url: article.url), label: {
                        CardView(article: article)
                    })
                }.navigationBarTitle("NewTok")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






