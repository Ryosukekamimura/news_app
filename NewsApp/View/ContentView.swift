//
//  ContentView.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/26.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import WebKit


struct ContentView: View {
    
    @ObservedObject var list = getData()
    
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        ForEach(self.list.newsdatas, id:\.self) { article in
                            
                           
                                    CardView(article: article)
                            
                            
                        }
                      
                    }.frame(width: geometry.size.width)
                }
                .foregroundColor(.black)
                .navigationBarHidden(true)
            }
        }.background(Color(.black).edgesIgnoringSafeArea(.all))
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





