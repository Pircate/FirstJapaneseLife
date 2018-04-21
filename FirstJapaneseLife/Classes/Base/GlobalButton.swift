//
//  GlobalButton.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/15.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class GlobalButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(title: String) {
        self.init(type: .custom)
        backgroundColor = .global
        layer.cornerRadius = 5
        layer.masksToBounds = true
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
