//
//  DetailAddressCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class DetailAddressCell: UITableViewCell {

    lazy var leftLabel: UILabel = {
        let leftLabel = UILabel()
        leftLabel.font = UIFont.systemFont(ofSize: 16)
        leftLabel.textColor = UIColor.lightText
        return leftLabel
    }()

    lazy var rightLabel: UILabel = {
        let rightLabel = UILabel()
        rightLabel.numberOfLines = 0
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        rightLabel.textColor = UIColor.darkText
        return rightLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)

        leftLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }

        rightLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
