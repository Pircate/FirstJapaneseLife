//
//  FacilityViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class FacilityViewController: BaseViewController {

    lazy var tabMenuView: TabMenuView = {
        let menu = TabMenuView(titles: facilityList)
        menu.didSelectItemHandler = { [weak self] (index) in
            let indexPath = IndexPath(item: 0, section: index)
            self?.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
        return menu
    }()

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: CGFloat(UIScreen.width / 2), height: 44)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FacilityListCell.self, forCellWithReuseIdentifier: "FacilityListCell")
        collectionView.register(FacilityHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView")
        return collectionView
    }()
    
    var facilityList: [String] {
        return LanguageManager.shared.isJapanese ? FacilityData.jFacilityList : FacilityData.facilityList
    }
    
    var allFacilityList: [[String]] {
        return LanguageManager.shared.isJapanese ? FacilityData.jAllList : FacilityData.allList
    }

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = "施設"
        
        addSubviews()
        disableAdjustsScrollViewInsets(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func languageWillChange(sender: Notification) {
        collectionView.reloadData()
    }
    
    // MARK: - private
    private func addSubviews() {

        view.addSubview(tabMenuView)
        tabMenuView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.equalToSuperview()
            make.size.equalTo(CGSize(width: UIScreen.width, height: 44))
        }

        let lineView = UIView()
        lineView.backgroundColor = UIColor(hex: "#E5E5E5")
        view.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(tabMenuView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension FacilityViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return facilityList.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFacilityList[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FacilityListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilityListCell", for: indexPath) as! FacilityListCell
        cell.titleLabel.text = allFacilityList[indexPath.section][indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FacilityHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView", for: indexPath) as! FacilityHeaderView
        header.titleLabel.text = facilityList[indexPath.section]
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension FacilityViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.ay_navigationItem.title = allFacilityList[indexPath.section][indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FacilityViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.width, height: 50)
    }
}
