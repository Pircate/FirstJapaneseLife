//
//  ServiceWorkViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/15.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class ServiceWorkViewController: BaseViewController {

    var serviceModel = ServiceListModel()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.hairline
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

    override func languageWillChange(sender: Notification) {
        ay_navigationItem.title = serviceModel.name
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ServiceWorkViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return serviceModel.contents.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ServiceChildTextCell = tableView.dequeueReusableCell(withIdentifier: "ServiceChildTextCell") as! ServiceChildTextCell
        cell.textView.text = serviceModel.contents[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ServiceWorkViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let content = serviceModel.contents[indexPath.row] as NSString
        let frame = content.boundingRect(with: CGSize(width: UIScreen.width - 30, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return frame.height + 20
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
