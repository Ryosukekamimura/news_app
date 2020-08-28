//
//  SampleView.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/28.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        
        VStack {
            Spacer()
            
            
            VStack(alignment: .center, spacing: 10){
                Text("中日・福谷、甲子園で3被弾6失点 陽川に3ラン、ボーアには2発…「リードに応えきれず」 - 中日新聞")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("◇26日　阪神―中日（甲子園）　中日の福谷浩司投手（２９）が、２６日の阪神戦（甲子園）に先発し、６イニングを投げて３本塁打を浴びるなど...")
                    .lineLimit(2)
                    .foregroundColor(.white)
            }.background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)))
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
