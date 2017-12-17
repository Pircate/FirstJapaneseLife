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
}
