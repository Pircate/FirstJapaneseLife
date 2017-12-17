//
//  DetailModel.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/17.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation
import HandyJSON

struct DetailModel: HandyJSON {
    
    var name: String? {
        return LanguageManager.shared.isJapanese ? jname : cname
    }
    var cname: String?
    var jname: String?
    var image: String?
    var desc: String? {
        return LanguageManager.shared.isJapanese ? jdesc : cdesc
    }
    var cdesc: String?
    var jdesc: String?
    var address: String? {
        return LanguageManager.shared.isJapanese ? jaddress : caddress
    }
    var caddress: String?
    var jaddress: String?
    var telphone: String?
    var open_time: String?
}
