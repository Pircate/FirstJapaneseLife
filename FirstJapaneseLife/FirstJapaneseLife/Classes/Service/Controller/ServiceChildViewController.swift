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
        return tableView
    }()
    
    lazy var siteDataSource: [String] = {
        let dataSource = ["琦玉银行", "大阪银行"]
        return dataSource
    }()
    
    lazy var imageDataSource: [String] = {
        let dataSource = [String]()
        return dataSource
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        setupTableFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private
    private func setupTableFooterView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 44))
        let playBtn = UIButton(type: .custom)
        playBtn.setTitle("播放", for: .normal)
        playBtn.backgroundColor = .global
        playBtn.layer.cornerRadius = 5
        playBtn.layer.masksToBounds = true
        playBtn.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        footerView.addSubview(playBtn)
        playBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
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
        case 2:
            return imageDataSource.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceListCell")
        if indexPath.section == 0 {
            cell?.textLabel?.text = siteDataSource[indexPath.row]
        }
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let serviceDetailVC = ServiceDetailViewController()
        serviceDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(serviceDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 44
        case 1:
            return 100
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .orange
        let titleLabel = UILabel()
        titleLabel.text = ["场所", "流程", "准备", "对话例"][section]
        titleLabel.textAlignment = .center
        header.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
