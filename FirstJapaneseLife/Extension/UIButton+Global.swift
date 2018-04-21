//
//  UIButton+Global.swift
//  FirstJapaneseLife
//
//  Created by GorXion on 2018/4/21.
//  Copyright © 2018年 G-Xi0N. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .custom)
        backgroundColor = .global
        layer.cornerRadius = 5
        layer.masksToBounds = true
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
}
