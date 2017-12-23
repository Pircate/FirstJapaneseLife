//
//  ServiceChildReadyCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class ServiceChildReadyCell: UITableViewCell {

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: CGFloat((UIScreen.width - 70) / 3), height: UIScreen.width / 2 - 22)
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ReadyPictureCell.self, forCellWithReuseIdentifier: "ReadyPictureCell")
        return collectionView
    }()

    var images: [String] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var didSelectItemHandler: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.images = [String]()
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func imageText(name: String) -> String {
        switch name {
        case "service_ready_bankbook":
            return LanguageManager.shared.isJapanese ? "口座" : "银行账户"
        case "service_ready_address":
            return LanguageManager.shared.isJapanese ? "住所" : "房屋地址"
        case "service_ready_insurance":
            return LanguageManager.shared.isJapanese ? "国民健康保険証" : "国民健康保险证"
        case "service_ready_phone":
            return LanguageManager.shared.isJapanese ? "携帯番号" : "手机号"
        case "service_ready_request":
            return LanguageManager.shared.isJapanese ? "請求書" : "请求书"
        case "service_ready_residence":
            return LanguageManager.shared.isJapanese ? "在留カード" : "在留卡"
        case "service_ready_seal":
            return LanguageManager.shared.isJapanese ? "印鑑" : "印章"
        case "service_ready_studentID":
            return LanguageManager.shared.isJapanese ? "学生証" : "学生证"
        default:
            return ""
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ServiceChildReadyCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ReadyPictureCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReadyPictureCell", for: indexPath) as! ReadyPictureCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.nameLabel.text = imageText(name: images[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ServiceChildReadyCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if didSelectItemHandler != nil {
            didSelectItemHandler!(indexPath.item)
        }
    }
}
