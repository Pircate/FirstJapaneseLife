//
//  TitleHeaderView.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class TitleHeaderView: UIView {

    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        return iconView
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .global
        return titleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor(hex: "#F2F7FA")

        addSubview(iconView)
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        iconView.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp.left).offset(-5)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
