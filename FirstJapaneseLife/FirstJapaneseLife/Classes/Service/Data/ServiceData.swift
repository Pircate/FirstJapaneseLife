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

    static let rentingList = ["东洋不动产", "铃建房屋有限公司", "MAST三幸房产有限公司"]

    static let insuranceList = ["宫代町办事处"]

    static let bankList = ["邮储银行", "埼玉Resona银行"]

    static let phoneHallList = ["Softbank", "au"]

    static let marketList = ["Giga市场"]

    static let shoppingList = ["Giga市场", "Kasumi", "Belx", "Aoki青木", "Seki", "Cainz Home", "7-11", "全家", "罗森"]

    static let dietLsit = ["台湾料理阿福", "中华料理龙盛房", "中华料理一心", "肉便当", "中华料理王家", "鱼民", "Krumaya拉面", "中华料理日高屋", "乐天利", "Echigoya", "面屋 彬", "萨莉亚", "温野菜"]

    static let entertainmentList = ["卡拉OK BOX舞台MAX", "Big ball"]

    static let payList = ["7-11", "全家", "罗森"]

    static let illList = ["今井病院", "东埼玉综合病院"]

    static var allList: [[String]] {
        return [rentingList, insuranceList, bankList, phoneHallList, marketList, shoppingList, dietLsit, entertainmentList, payList, illList, [], []]
    }
}
