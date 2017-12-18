//
//  LocalizableString.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation

struct LocalizableString {

    static var backButtonTitle: String {
        return LanguageManager.shared.isJapanese ? "もどる" : "上一页"
    }
    
    static var homeButtonTitle: String {
        return LanguageManager.shared.isJapanese ? "キーページ" : "起始页"
    }

    static var facilityTitle: String {
        return LanguageManager.shared.isJapanese ? "施設" : "设施"
    }

    static var serviceTitle: String {
        return LanguageManager.shared.isJapanese ? "サービス" : "服务"
    }
}
