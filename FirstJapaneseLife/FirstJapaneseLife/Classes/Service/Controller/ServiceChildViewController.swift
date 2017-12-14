//
//  ServiceChildViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import AVFoundation

class ServiceChildViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: "ServiceListCell")
        tableView.register(ServiceChildReadyCell.self, forCellReuseIdentifier: "ServiceChildReadyCell")
        tableView.register(ServiceChildTextCell.self, forCellReuseIdentifier: "ServiceChildTextCell")
        return tableView
    }()

    var siteDataSource = [String]()
    
    lazy var imageDataSource: [String] = {
        let dataSource = [String]()
        return dataSource
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(ay_navigationBar.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        setupTableFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private
    private func setupTableFooterView() {

        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 60))
        let playBtn = UIButton(type: .custom)
        playBtn.setTitle("播放", for: .normal)
        playBtn.backgroundColor = .global
        playBtn.layer.cornerRadius = 5
        playBtn.layer.masksToBounds = true
        playBtn.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        footerView.addSubview(playBtn)
        playBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth - 30, height: 36))
        }
        tableView.tableFooterView = footerView
    }
    
    // MARK: - action
    @objc private func playButtonAction() {
        VoiceSpeaker.speak("初めての日本生活")
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return siteDataSource.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell: ServiceListCell = tableView.dequeueReusableCell(withIdentifier: "ServiceListCell") as! ServiceListCell
            cell.titleLabel.text = siteDataSource[indexPath.row]
            return cell
        case 2:
            let cell: ServiceChildReadyCell = tableView.dequeueReusableCell(withIdentifier: "ServiceChildReadyCell") as! ServiceChildReadyCell
            return cell

        default:
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.section == 0 else {
            return
        }
        let detailVC = DetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.ay_navigationItem.title = ServiceData.allList[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 44
        case 1:
            return 200
        case 2:
            return 120
        default:
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor(hex: "#F2F7FA")

        let iconImgs = ["service_child_site", "service_child_flow", "service_child_ready", "service_child_chat"]
        let iconView = UIImageView(image: UIImage(named: iconImgs[section]))
        header.addSubview(iconView)

        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.text = ["场所", "流程", "准备", "对话例"][section]
        titleLabel.textAlignment = .center
        titleLabel.textColor = .global
        header.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        iconView.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp.left).offset(-5)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
