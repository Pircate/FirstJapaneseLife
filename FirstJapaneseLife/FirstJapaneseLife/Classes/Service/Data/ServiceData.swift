//
//  ServiceData.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation

struct ServiceData {
    static let serviceList = ["租房", "住民登录及国民健康保险加入", "开设银行户头", "购买手机", "自行车相关", "购物", "吃饭", "娱乐", "支付各项费用", "生病时", "作为学生", "想要打工"]
    
    static let jServiceList = ["借家", "住民登録や国民健康保険加入", "銀行口座を開設する", "携帯電話を買う", "自転車関連", "ショッピング", "食事", "娯楽", "諸費用を支払う", "病気の時", "学生として", "アルバイトがしたい"]

    static let rentingList = ["东洋不动产", "铃建房屋有限公司", "MAST三幸房产有限公司"]
    
    static let jRentingList = ["東洋不動産", "ベル建設有限会社", "MAST三幸不動産有限公司"]

    static let insuranceList = ["宫代町办事处"]
    
    static let jInsuranceList = ["宮代町事務所"]

    static let bankList = ["邮储银行", "埼玉Resona银行"]
    
    static let jBankList = ["郵便銀行", "埼玉系銀行"]

    static let phoneHallList = ["Softbank", "au"]

    static let jPhoneHallList = ["Softbank", "au"]
    
    static let marketList = ["Giga市场"]
    
    static let jMarketList = ["Giga市場"]

    static let shoppingList = ["Giga市场", "Kasumi", "Belx", "Aoki青木", "Seki", "Cainz Home", "7-11", "全家", "罗森"]
    
    static let jShoppingList = ["Giga市場", "Kasumi", "Belx", "Aoki青木", "Seki", "Cainz Home", "7-11", "全家", "ローソン"]

    static let dietLsit = ["台湾料理阿福", "中华料理龙盛房", "中华料理一心", "肉便当", "中华料理王家", "鱼民", "Krumaya拉面", "中华料理日高屋", "乐天利", "Echigoya", "面屋 彬", "萨莉亚", "温野菜"]
    
    static let jDietLsit = ["台湾料理と料理", "中華料理竜盛房", "中華料理の一心", "肉弁当", "中華料理の王家", "魚民", "Krumayaラーメン", "中華料理の日高屋", "ロッテ・リー", "Echigoya", "ビンビン", "サリア", "山菜"]

    static let entertainmentList = ["卡拉OK BOX舞台MAX", "Big ball"]
    
    static let jEntertainmentList = ["カラオケボックス", "Big ball"]

    static let payList = ["7-11", "全家", "罗森"]
    
    static let jPayList = ["7-11", "全家", "ローソン"]

    static let illList = ["今井病院", "东埼玉综合病院"]
    
    static let jIllList = ["今井病院", "東埼玉総合病院"]

    static var allList: [[String]] {
        return [rentingList, insuranceList, bankList, phoneHallList, marketList, shoppingList, dietLsit, entertainmentList, payList, illList, [], []]
    }
    
    static var jAllList: [[String]] {
        return [jRentingList, jInsuranceList, jBankList, jPhoneHallList, jMarketList, jShoppingList, jDietLsit, jEntertainmentList, jPayList, jIllList, [], []]
    }
}
