//
//  TabMenuCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

struct TabMenuModel {
    var title: String?
    var titleNormalColor: UIColor?
    var titleSelectedColor: UIColor?
    var backgroundLayerColor: UIColor?
    var underlineColor: UIColor?
}

class TabMenuCell: UICollectionViewCell {

    static let underlineHeight: CGFloat = 2.0
    static let backgroundLayerHeight: CGFloat = 3.0

    lazy var backgroundLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: TabMenuCell.backgroundLayerHeight)
        return layer
    }()

    lazy var titleButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = self.contentView.bounds
        btn.isUserInteractionEnabled = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()

    lazy var underline: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: self.contentView.center.x, y: self.contentView.bounds.height - TabMenuCell.underlineHeight, width: 0, height: TabMenuCell.underlineHeight)
        return layer
    }()

    var model: TabMenuModel? {
        didSet {
            backgroundLayer.backgroundColor = model?.backgroundLayerColor?.cgColor
            titleButton.setTitleColor(model?.titleNormalColor, for: .normal)
            titleButton.setTitleColor(model?.titleSelectedColor, for: .selected)
            titleButton.setTitle(model?.title, for: .normal)
            underline.backgroundColor = model?.underlineColor?.cgColor;
        }
    }

    private static var deselectDisabled = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            TabMenuCell.deselectDisabled = isHighlighted
        }
    }

    override var isSelected: Bool {
        didSet {
            let flag = TabMenuCell.deselectDisabled ? oldValue : isSelected
            titleButton.isSelected = flag
            backgroundLayer.frame.size.height = flag ? self.contentView.bounds.height : TabMenuCell.backgroundLayerHeight
            underline.frame.origin.x = flag ? 0 : self.contentView.center.x
            underline.frame.size.width = flag ? self.contentView.bounds.width : 0
        }
    }

    // MARK: - private
    private func addSubviews() {
        contentView.layer.addSublayer(backgroundLayer)
        contentView.addSubview(titleButton)
        contentView.layer.addSublayer(underline)
    }
}
