//
//  LanguageManager.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation

let kIsJapaneseKey = "LanguageIsJapanese"
let kLanguageWillChangeNotification = "FJLLanguageWillChangeNotification"

class LanguageManager {

    static let shared = LanguageManager()
    private init() {}

    var isJapanese: Bool {
        get {
            return UserDefaults.standard.bool(forKey: kIsJapaneseKey)
        }
        set {
            if isJapanese != newValue {
                NotificationCenter.default.post(name: NSNotification.Name(kLanguageWillChangeNotification), object: nil)
            }
            UserDefaults.standard.set(newValue, forKey: kIsJapaneseKey)
            UserDefaults.standard.synchronize()
        }
    }
}
