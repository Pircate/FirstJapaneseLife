//
//  FacilityHeaderView.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class FacilityHeaderView: UICollectionReusableView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#BCBCBC")
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }

        let line = CALayer()
        line.frame = CGRect(x: 15, y: 0, width: UIScreen.width - 30, height: 0.4)
        line.backgroundColor = UIColor(hex: "#E5E5E5").cgColor
        self.layer.addSublayer(line)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
