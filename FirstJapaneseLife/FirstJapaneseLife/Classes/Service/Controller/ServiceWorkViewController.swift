//
//  ServiceWorkViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/15.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class ServiceWorkViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor(hex: "#E5E5E5")
        tableView.register(ServiceChildTextCell.self, forCellReuseIdentifier: "ServiceChildTextCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        disableAdjustsScrollViewInsets(tableView)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDataSource
extension ServiceWorkViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ServiceChildTextCell = tableView.dequeueReusableCell(withIdentifier: "ServiceChildTextCell") as! ServiceChildTextCell
        cell.textView.text = """
        初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活
        初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活
        初めての日本生活初めての日本生活初めての日本生活初めての日本生活
        """
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ServiceWorkViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TitleHeaderView()
        let iconImgs = ["service_child_time", "service_child_work"]
        header.iconView.image = UIImage(named: iconImgs[section])
        header.titleLabel.textColor = UIColor(hex: "#8a8a8a")
        header.titleLabel.text = ["时间限制", "找工作"][section]
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
