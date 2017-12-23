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
        return LanguageManager.shared.isJapanese ? "戻る" : "返回"
    }
    
    static var homeButtonTitle: String {
        return LanguageManager.shared.isJapanese ? "トップ" : "首页"
    }

    static var facilityTitle: String {
        return LanguageManager.shared.isJapanese ? "施設" : "设施"
    }

    static var serviceTitle: String {
        return LanguageManager.shared.isJapanese ? "サービス" : "服务"
    }
    
    static var serviceChildTitles: [String] {
        return LanguageManager.shared.isJapanese ? ["場所", "流れ", "準備必要とする物", "対話例"] : ["场所", "流程", "需要准备的材料", "对话例"]
    }
    
    static var playButtonTitle: String {
        return LanguageManager.shared.isJapanese ? "クリックすると録音が再生される" : "点击播放录音"
    }
    
    static var detailSectionTitles: [String] {
        return LanguageManager.shared.isJapanese ? ["绍介", "位置", "地図"] : ["介绍", "位置", "地图"]
    }
}
