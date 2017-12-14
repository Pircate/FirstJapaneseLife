//
//  FacilityViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class FacilityViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    lazy var tabMenuView: TabMenuView = {
        let menu = TabMenuView(titles: FacilityData.facilityList)
        menu.didSelectItemHandler = { (index) in
            let indexPath = IndexPath(item: 0, section: index)
            self.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
        return menu
    }()

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: CGFloat(kScreenWidth / 2), height: 44)
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FacilityListCell.self, forCellWithReuseIdentifier: "FacilityListCell")
        collectionView.register(FacilityHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView")
        return collectionView
    }()
    
    lazy var dataSource: [String] = {
        let dataSource = FacilityData.facilityList
        return dataSource
    }()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = "施設"
        
        addSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private
    private func addSubviews() {

        view.addSubview(tabMenuView)
        tabMenuView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 36))
        }

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(tabMenuView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FacilityData.allList[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FacilityListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilityListCell", for: indexPath) as! FacilityListCell
        cell.titleLabel.text = FacilityData.allList[indexPath.section][indexPath.item]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let childVC = FacilityChildViewController()
        childVC.ay_navigationItem.title = FacilityData.allList[indexPath.section][indexPath.item]
        navigationController?.pushViewController(childVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FacilityHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView", for: indexPath) as! FacilityHeaderView
        header.titleLabel.text = dataSource[indexPath.section]
        return header
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: kScreenWidth, height: 50)
    }

}
