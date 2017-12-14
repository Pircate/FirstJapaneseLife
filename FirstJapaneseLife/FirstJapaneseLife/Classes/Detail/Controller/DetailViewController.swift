//
//  DetailViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        disableAdjustsScrollViewInsets(tableView)
        ay_navigationBar.alpha = 0

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
//            make.top.equalTo(ay_navigationBar.snp.bottom)
//            make.left.bottom.right.equalToSuperview()
            make.edges.equalToSuperview()
        }

        setupTableHeaderView()
    }

    private func setupTableHeaderView() {
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 200))
        headerView.image = UIImage(named: "home_background")
        tableView.tableHeaderView = headerView
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 3
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")

        return cell!
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor(hex: "#F2F7FA")

        let iconImgs = ["detail_header_intro", "detail_header_address", "detail_header_map"]
        let iconView = UIImageView(image: UIImage(named: iconImgs[section]))
        header.addSubview(iconView)

        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.text = ["介绍", "位置", "地图"][section]
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

    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            let alpha = scrollView.contentOffset.y / CGFloat(136)
            ay_navigationBar.alpha = alpha
        }
        else {
            let alpha = -scrollView.contentOffset.y / ay_navigationBar.frame.maxY
            ay_navigationBar.alpha = alpha
        }
    }

}
