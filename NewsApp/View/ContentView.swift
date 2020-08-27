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
            List(list.newsdatas, id:\.self){ article in
                NavigationLink(destination: webView(url: article.url), label: {
                    HStack(spacing: 15){
                        
                        VStack(alignment: .center, spacing: 10){
                            Text(article.title).font(.headline)
                            Text(article.desc).lineLimit(2)
                        }
                        
                        if article.image != "" {
                            WebImage(url: URL(string: article.image)!, options: .highPriority, context: nil)
                                .resizable()
                                .frame(width: 120, height: 130)
                                .cornerRadius(20)
                        }
                    }.padding(.vertical, 15)
                    
                })
                
                
                
            }.navigationBarTitle("NewTok")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






