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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: "ServiceListCell")
        return tableView
    }()
    
    lazy var dataSource: [String] = {
        let dataSource = ["租房", "住民登录及国民健康保险加入", "开设银行户头", "购买手机", "自行车相关", "购物", "吃饭", "娱乐", "支付各项费用", "生病时", "作为学生", "想要打工"]
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            make.edges.equalToSuperview()
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

        let serviceChildVC = ServiceChildViewController()
        serviceChildVC.navigationItem.title = dataSource[indexPath.row]
        serviceChildVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(serviceChildVC, animated: true)
    }

}
