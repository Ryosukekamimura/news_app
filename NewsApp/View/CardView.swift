//
//  CardView.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/27.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    var article : News
    
    var body: some View {
        HStack(spacing: 15){
            if article.image != "" {
                WebImage(url: URL(string: article.image)!, options: .highPriority, context: nil)
                    .resizable()
                    .frame(width: 100, height: 130)
                    .cornerRadius(20)
                    .edgesIgnoringSafeArea(.all)
            }else {
                Image("noimage")
                    .resizable()
                    .frame(width: 120, height: 130)
                    .cornerRadius(20)
                    .edgesIgnoringSafeArea(.top)
            }
                        
            VStack(alignment: .center, spacing: 10){
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(article.desc)
                    .lineLimit(2)
                    .foregroundColor(.black)
            }
        }.padding(.vertical, 15)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(article: News(id: "2020-08-26T11:15:16Z",
                               title: "中日・福谷、甲子園で3被弾6失点 陽川に3ラン、ボーアには2発…「リードに応えきれず」 - 中日新聞",
                               desc: "◇26日　阪神―中日（甲子園）　中日の福谷浩司投手（２９）が、２６日の阪神戦（甲子園）に先発し、６イニングを投げて３本塁打を浴びるなど...",
                               url: "https://www.chunichi.co.jp/article/110508",
                               image: "https://static.chunichi.co.jp/image/article/size1/8/b/0/7/8b077a2a2338df1fcf66a2bba6bd882d_1.jpg"))
    }
}
