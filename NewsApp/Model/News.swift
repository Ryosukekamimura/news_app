//
//  News.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/27.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation




struct News : Identifiable, Hashable{
    var id : String
    var title : String
    var desc : String
    var url : String
    var image : String
}
