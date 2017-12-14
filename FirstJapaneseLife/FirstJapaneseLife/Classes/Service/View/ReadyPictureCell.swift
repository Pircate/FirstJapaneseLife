//
//  ReadyPictureCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class ReadyPictureCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
