//
//  ServiceViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import SnapKit

class ServiceViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(hex: "#F2F7FA")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor(hex: "#E5E5E5")
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 15))
        headerView.backgroundColor = UIColor(hex: "#F2F7FA")
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: "ServiceListCell")
        return tableView
    }()
    
    lazy var dataSource: [String] = {
        let dataSource = ServiceData.serviceList
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = "サービス"
        addSubviews()
        disableAdjustsScrollViewInsets(tableView)
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
        cell.iconView.image = UIImage(named: "service_icon_\(indexPath.row)")
        cell.titleLabel.text = dataSource[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let serviceChildVC = ServiceChildViewController()
        serviceChildVC.ay_navigationItem.title = dataSource[indexPath.row]
        serviceChildVC.hidesBottomBarWhenPushed = true
        serviceChildVC.siteDataSource = ServiceData.allList[indexPath.row]
        navigationController?.pushViewController(serviceChildVC, animated: true)
    }

}
