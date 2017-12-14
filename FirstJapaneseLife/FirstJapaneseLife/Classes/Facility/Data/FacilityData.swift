//
//  FacilityData.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import Foundation

struct FacilityData {

    static let facilityList = ["学校", "银行", "房屋中介", "办事处", "手机营业厅", "超市", "便利店", "饮食", "医院", "娱乐", "ATM"]

    static let schoolList = ["日本工业大学"]

    static let bankList = ["邮储银行", "埼玉Resona银行"]

    static let agencyList = ["东洋不动产", "铃建房屋有限公司", "MAST三幸房产有限公司"]

    static let officeList = ["宫代町办事处"]

    static let phoneHallList = ["Softbank", "au"]

    static let supermarketList = ["Giga市场", "Kasumi", "Belx", "Aoki青木", "Seki", "Cainz Home"]

    static let storeList = ["7-11", "全家", "罗森"]

    static let restaurantList = ["台湾料理阿福", "中华料理龙盛房", "中华料理一心", "肉便当", "中华料理王家", "鱼民", "Krumaya拉面", "中华料理日高屋", "乐天利", "Echigoya", "面屋 彬", "萨莉亚", "温野菜"]

    static let hospitalList = ["今井病院", "东埼玉综合病院"]

    static let entertainmentList = ["卡拉OK BOX舞台MAX", "Big ball"]

    static let ATMList = ["埼玉Resona银行ATM", "邮储银行ATM", "Seven银行ATM", "全家ATM", "罗森ATM", "E.net"]

    static var allList: [[String]] {
        return [schoolList, bankList, agencyList, officeList, phoneHallList, supermarketList, storeList, restaurantList, hospitalList, entertainmentList, ATMList]
    }
}
