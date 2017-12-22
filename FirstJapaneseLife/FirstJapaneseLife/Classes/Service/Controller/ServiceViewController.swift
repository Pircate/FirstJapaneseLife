//
//  ServiceViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import SnapKit
import HandyJSON

class ServiceViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(hex: "#F2F7FA")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 44.0
        tableView.separatorColor = UIColor.hairline
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 15))
        headerView.backgroundColor = UIColor(hex: "#F2F7FA")
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: "ServiceListCell")
        return tableView
    }()
    
    lazy var dataSource: [ServiceListModel] = {
        let dataSource = [ServiceListModel]()
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = LocalizableString.serviceTitle
        addSubviews()
        disableAdjustsScrollViewInsets(tableView)
        loadServiceData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func languageWillChange(sender: Notification) {
        ay_navigationItem.title = LocalizableString.serviceTitle
        tableView.reloadData()
    }
    
    // MARK: - private
    private func addSubviews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    private func loadServiceData() {
        let path = Bundle.main.path(forResource: "ServiceData", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let result = result as? [Any] {
                dataSource = [ServiceListModel].deserialize(from: result) as! [ServiceListModel]
                tableView.reloadData()
            }
        } catch {}
    }
}

// MARK: - UITableViewDataSource
extension ServiceViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ServiceListCell = tableView.dequeueReusableCell(withIdentifier: "ServiceListCell") as! ServiceListCell
        cell.iconView.image = UIImage(named: "service_icon_\(indexPath.row)")
        let model = dataSource[indexPath.row]
        cell.titleLabel.text = model.name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ServiceViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = dataSource[indexPath.row]
        switch indexPath.row {
        case 10:
            let serviceStudentVC = ServiceStudentViewController()
            serviceStudentVC.ay_navigationItem.title = model.name
            serviceStudentVC.serviceModel = model
            navigationController?.pushViewController(serviceStudentVC, animated: true)
        case 11:
            let serviceWorkVC = ServiceWorkViewController()
            serviceWorkVC.ay_navigationItem.title = model.name
            serviceWorkVC.serviceModel = model
            navigationController?.pushViewController(serviceWorkVC, animated: true)
        default:
            let serviceChildVC = ServiceChildViewController()
            serviceChildVC.serviceModel = model
            serviceChildVC.ay_navigationItem.title = model.name
            navigationController?.pushViewController(serviceChildVC, animated: true)
        }
    }
}
