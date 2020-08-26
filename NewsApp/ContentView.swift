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
    
    @ObservedObject var list = newsgetData()
    
    
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


struct newsdataType : Identifiable, Hashable{
    var id : String
    var title : String
    var desc : String
    var url : String
    var image : String
    
    
}


class newsgetData : ObservableObject{
    
    @Published var newsdatas = [newsdataType]()
    
    let NEWSAPIKEY: String = KeyManager().getValue(key: "newsApiKey") as! String
    
    
    init() {
        
        let source = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=\(self.NEWSAPIKEY)"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for i in json["articles"]{
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let urlToImage = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    self.newsdatas.append(newsdataType(id: id, title: title, desc: description, url: url, image: urlToImage))
                    print(self.newsdatas)
                }
            }
        }.resume()
    }
    
    
    
}

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
