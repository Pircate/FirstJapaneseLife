//
//  TabMenuView.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class TabMenuView: UIView {

    static let menuHeight: CGFloat = 44.0

    public var didSelectItemHandler: ((Int) -> Void)?

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.width / CGFloat(titles.count), height: 44)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        for (index, item) in titles.enumerated() {
            collectionView.register(TabMenuCell.self, forCellWithReuseIdentifier: "TabMenuCell_\(index)")
        }
        if titles.count > 0 {
            collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        }
        return collectionView
    }()

    private var titles = [String]()
    private var dataSource = [TabMenuModel]()
    private var itemWidths = [CGFloat]()
    private var currentIndex = 0

    init(titles: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: TabMenuView.menuHeight))

        self.titles = titles

        configureDataSource()
        figureItemWidth()
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private
    private func configureDataSource() {

        let colors = [UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0"), UIColor(hex: "#70c1b3"), UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0"), UIColor(hex: "#70c1b3"), UIColor(hex: "#f25f5c"), UIColor(hex: "#ffe066"), UIColor(hex: "#247ba0")]

        for (index, title) in titles.enumerated() {
            let model = TabMenuModel(title: title, titleNormalColor: .global, titleSelectedColor: .white, backgroundLayerColor: colors[index], underlineColor: .clear)
            dataSource.append(model)
        }
    }

    private func figureItemWidth() {
        for title in titles {
            let width = CGFloat(title.count * 15 + 30)
            itemWidths.append(width)
        }
    }

    private func addSubviews() {
        self.addSubview(collectionView)
    }

    // MARK: - public
    public func selectItem(at index: Int) {

        guard currentIndex != index else {
            return
        }
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        currentIndex = index
    }
}

// MARK: - UICollectionViewDataSource
extension TabMenuView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TabMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabMenuCell_\(indexPath.item)", for: indexPath) as! TabMenuCell
        cell.model = dataSource[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension TabMenuView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        guard currentIndex != indexPath.item else {
            return
        }
        currentIndex = indexPath.item
        if didSelectItemHandler != nil {
            didSelectItemHandler!(currentIndex)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TabMenuView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidths[indexPath.item], height: TabMenuView.menuHeight)
    }
}
