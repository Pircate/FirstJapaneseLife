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
            return "銀行口座"
        case "service_ready_address":
            return "地址"
        case "service_ready_insurance":
            return "保险"
        case "service_ready_phone":
            return "手机号码"
        case "service_ready_request":
            return "请求书"
        case "service_ready_residence":
            return "在留卡"
        case "service_ready_seal":
            return "印章"
        case "service_ready_studentID":
            return "学生证"
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
