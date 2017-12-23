//
//  DetailModel.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/17.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation
import HandyJSON

struct DetailInfoModel: HandyJSON {
    var name: String? {
        return LanguageManager.shared.isJapanese ? jname : cname
    }
    var cname: String?
    var jname: String?
    var content: String? {
        return LanguageManager.shared.isJapanese ? jcontent : ccontent
    }
    var ccontent: String?
    var jcontent: String?
}

struct DetailModel: HandyJSON {
    
    var name: String? {
        return LanguageManager.shared.isJapanese ? jname : cname
    }
    var cname: String?
    var jname: String?
    var images: [String]?
    var desc: String? {
        return LanguageManager.shared.isJapanese ? jdesc : cdesc
    }
    var cdesc: String?
    var jdesc: String?
    var info = [DetailInfoModel]()
    var website: String?
    var address: String? {
        return LanguageManager.shared.isJapanese ? jaddress : caddress
    }
    var caddress: String?
    var jaddress: String?
    var telphone: String?
    var open_time: String?
}
