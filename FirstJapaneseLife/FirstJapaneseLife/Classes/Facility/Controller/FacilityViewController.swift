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
        let menu = TabMenuView(titles: titles)
        menu.didSelectItemHandler = { [weak self] (index) in
            let indexPath = IndexPath(item: 0, section: index)
            self?.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
            if index < (self?.dataSource.count)! - 1 {
                self?.collectionView.contentOffset.y -= 50
            }
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
        collectionView.bounces = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 280, right: 0)
        collectionView.register(FacilityListCell.self, forCellWithReuseIdentifier: "FacilityListCell")
        collectionView.register(FacilityHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView")
        return collectionView
    }()
    
    lazy var dataSource: [FacilityListModel] = {
        let dataSource = [FacilityListModel]()
        return dataSource
    }()
    
    lazy var titles: [String] = {
        let titles = ["学校", "银行", "房屋中介", "办事处", "手机营业厅", "超市", "便利店", "饮食", "医院", "娱乐", "ATM"]
        return titles
    }()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = LocalizableString.facilityTitle
        
        addSubviews()
        disableAdjustsScrollViewInsets(collectionView)
        loadFacilityData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func languageWillChange(sender: Notification) {
        ay_navigationItem.title = LocalizableString.facilityTitle
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
        lineView.backgroundColor = UIColor.hairline
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
    
    private func loadFacilityData() {
        let path = Bundle.main.path(forResource: "FacilityData", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let result = result as? [Any] {
                dataSource = [FacilityListModel].deserialize(from: result) as! [FacilityListModel]
                collectionView.reloadData()
            }
            
        } catch {}
    }
}

// MARK: - UICollectionViewDataSource
extension FacilityViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FacilityListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacilityListCell", for: indexPath) as! FacilityListCell
        let model = dataSource[indexPath.section].list[indexPath.item]
        cell.titleLabel.text = model.name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: FacilityHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FacilityHeaderView", for: indexPath) as! FacilityHeaderView
        let model = dataSource[indexPath.section]
        header.titleLabel.text = model.name
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension FacilityViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let model = dataSource[indexPath.section].list[indexPath.item]
        detailVC.detailModel = model
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FacilityViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.width, height: 50)
    }
}
