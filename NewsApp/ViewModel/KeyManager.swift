//
//  KeyManager.swift
//  NewsApp
//
//  Created by 神村亮佑 on 2020/08/26.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import Foundation

struct KeyManager {

    private let keyFilePath = Bundle.main.path(forResource: "Keys", ofType: "plist")

    func getKeys() -> Dictionary<String, AnyObject>? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath) as? Dictionary<String, AnyObject>
    }

    func getValue(key: String) -> AnyObject? {
        guard let keys = getKeys() else {
            return nil
        }
        return keys[key]
    }
}
