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
                        Spacer()
                    }.frame(width: geometry.size.width)
                }
                .foregroundColor(.black)
                .navigationBarTitle(Text("NewTok"))
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






