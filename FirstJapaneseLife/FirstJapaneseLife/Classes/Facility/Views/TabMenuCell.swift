//
//  TabMenuCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

struct TabMenuModel {
    var backgroundLayerColor: UIColor?
    var titleNormalColor: UIColor?
    var titleSelectedColor: UIColor?
    var deselectDisabled = false

    var title = ""
}

class TabMenuCell: UICollectionViewCell {

    lazy var backgroundLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 3)
        return layer
    }()

    lazy var titleButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = self.contentView.bounds
        btn.isUserInteractionEnabled = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()

    var model: TabMenuModel {
        willSet {
            backgroundLayer.backgroundColor = newValue.backgroundLayerColor?.cgColor
            titleButton.setTitleColor(newValue.titleNormalColor, for: .normal)
            titleButton.setTitleColor(newValue.titleSelectedColor, for: .selected)
            titleButton.setTitle(newValue.title, for: .normal)
        }
    }

    override init(frame: CGRect) {
        self.model = TabMenuModel()
        super.init(frame: frame)

        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isSelected: Bool {
        willSet {
            if model.deselectDisabled {
                return
            }
            titleButton.isSelected = newValue
            backgroundLayer.frame = newValue ? self.contentView.bounds : CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 3)
        }
    }

    // MARK: - private
    private func addSubviews() {
        contentView.layer.addSublayer(backgroundLayer)
        contentView.addSubview(titleButton)
    }
}
