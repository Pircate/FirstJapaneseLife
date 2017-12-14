//
//  TabMenuView.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class TabMenuView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var titles = [String]()

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: kScreenWidth / CGFloat(titles.count), height: 44)
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = .horizontal;
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        for (index, item) in titles.enumerated() {
            collectionView.register(TabMenuCell.self, forCellWithReuseIdentifier: "TabMenuCell_\(index)")
        }
        if titles.count > 0 {
            collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        }
        return collectionView
    }()

    var dataSource = [TabMenuModel]()
    var itemWidths = [CGFloat]()
    var didSelectItemHandler: ((Int) -> Void)?

    init(titles: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 36))

        self.titles = titles

        configDataSource()
        configItemWidth()
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private
    private func configDataSource() {

        let colors = [UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0"), UIColor(hex: "#70c1b3"), UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0"), UIColor(hex: "#70c1b3"), UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0")]

        for (index, title) in titles.enumerated() {
            let model = TabMenuModel(backgroundLayerColor: colors[index], titleNormalColor: .global, titleSelectedColor: .white, deselectDisabled: false, title: title)
            dataSource.append(model)
        }
    }

    private func configItemWidth() {
        for title in titles {
            let width = CGFloat(title.count * 15 + 30)
            itemWidths.append(width)
        }
    }

    private func addSubviews() {
        self.addSubview(collectionView)

        let underline = CALayer()
        underline.frame = CGRect(x: 0, y: self.bounds.height - 0.5, width: kScreenWidth, height: 0.5)
        underline.backgroundColor = UIColor(hex: "#E5E5E5").cgColor
        self.layer.addSublayer(underline)
    }

    // MARK: - public
    public func didSelectItem(atIndex index: Int) {
        let indexPath = IndexPath(item: index, section: 0)

        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TabMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabMenuCell_\(indexPath.item)", for: indexPath) as! TabMenuCell
        cell.model = dataSource[indexPath.item]
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidths[indexPath.item], height: 36)
    }

    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        var model = dataSource[indexPath.item]
        model.deselectDisabled = true
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        var model = dataSource[indexPath.item]
        model.deselectDisabled = false
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        if didSelectItemHandler != nil {
            didSelectItemHandler!(indexPath.item)
        }
    }
}
