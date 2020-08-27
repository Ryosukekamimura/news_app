//
//  GetData.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/27.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation
import SwiftyJSON


class getData : ObservableObject{
    
    @Published var newsdatas = [News]()
    
    let NEWSAPIKEY: String = KeyManager().getValue(key: "newsApiKey") as! String
    
    
    init() {
        
        let source = "https://newsapi.org/v2/top-headlines?country=jp&category=general&apiKey=\(self.NEWSAPIKEY)"
        
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
                    self.newsdatas.append(News(id: id, title: title, desc: description, url: url, image: urlToImage))
                    print(self.newsdatas)
                }
            }
        }.resume()
    }
    
    
    
}
