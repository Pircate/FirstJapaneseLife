//
//  FacilityViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class FacilityViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: "ServiceListCell")
        return tableView
    }()
    
    lazy var dataSource: [String] = {
        let dataSource = ["学校", "银行", "房屋中介", "办事处", "手机营业厅", "超市", "便利店", "饮食", "医院", "娱乐", "ATM"]
        return dataSource
    }()

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
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ServiceListCell = tableView.dequeueReusableCell(withIdentifier: "ServiceListCell") as! ServiceListCell
        cell.titleLabel.text = dataSource[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let facilityChildVC = FacilityChildViewController()
        facilityChildVC.ay_navigationItem.title = dataSource[indexPath.row]
        facilityChildVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(facilityChildVC, animated: true)
    }

}
