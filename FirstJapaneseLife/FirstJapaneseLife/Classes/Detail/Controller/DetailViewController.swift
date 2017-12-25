//
//  DetailViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import Agrume
import SDCycleScrollView

class DetailViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(ServiceChildTextCell.self, forCellReuseIdentifier: "ServiceChildTextCell")
        tableView.register(DetailMapCell.self, forCellReuseIdentifier: "DetailMapCell")
        tableView.register(DetailAddressCell.self, forCellReuseIdentifier: "DetailAddressCell")
        return tableView
    }()
    
    lazy var images: [UIImage] = {
        guard let images = detailModel.images else { return [UIImage]() }
        return images.map({
            return UIImage(named: $0)!
        })
    }()
    
    var detailModel = DetailModel()

    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        ay_navigationItem.title = detailModel.name
        disableAdjustsScrollViewInsets(tableView)
        ay_navigationBar.alpha = 0

        addSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func languageWillChange(sender: Notification) {
        ay_navigationItem.title = detailModel.name
        tableView.reloadData()
    }

    // MARK: - private
    private func addSubviews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        setupTableHeaderView()
    }

    private func setupTableHeaderView() {
        guard let images = detailModel.images else { return }
        let headerView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 240), imageNamesGroup: images)
        headerView?.delegate = self as SDCycleScrollViewDelegate
        tableView.tableHeaderView = headerView
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return detailModel.info.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell: ServiceChildTextCell = tableView.dequeueReusableCell(withIdentifier: "ServiceChildTextCell") as! ServiceChildTextCell
            cell.textView.text = detailModel.desc
            return cell
        case 1:
            let cell: DetailAddressCell = tableView.dequeueReusableCell(withIdentifier: "DetailAddressCell") as! DetailAddressCell
            let info = detailModel.info[indexPath.row]
            if let name = info.cname {
                if name == "网址" || name == "支店网址" {
                    cell.rightLabel.textColor = UIColor.global
                }
            }
            cell.leftLabel.text = info.name
            cell.rightLabel.text = info.content
            return cell
        default:
            let cell: DetailMapCell = tableView.dequeueReusableCell(withIdentifier: "DetailMapCell") as! DetailMapCell
            cell.address = detailModel.jaddress
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TitleHeaderView()
        let iconImgs = ["detail_header_intro", "detail_header_address", "detail_header_map"]
        header.iconView.image = UIImage(named: iconImgs[section])
        header.titleLabel.text = LocalizableString.detailSectionTitles[section]
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            if detailModel.desc == nil {
                return 0
            }
        }
        return 44
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            guard let desc = detailModel.desc as NSString? else {
                return 0
            }
            let frame = desc.boundingRect(with: CGSize(width: UIScreen.width - 30, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
            return frame.height + 20
        case 1:
            let info = detailModel.info[indexPath.row]
            if info.cname == "地址" {
                var frame = CGRect.zero
                if let address = info.content as NSString? {
                    frame = address.boundingRect(with: CGSize(width: UIScreen.width - 130, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
                }
                return frame.height + 28
            }
            return 44
        default:
            return 240
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let info = detailModel.info[indexPath.row]
        guard let name = info.cname else { return }
        if name == "网址" || name == "支店网址" {
            if let url = info.content {
                let webVC = WebViewController(url: url)
                webVC.ay_navigationBar.backgroundColor = UIColor.global
                webVC.ay_navigationItem.titleTextAttributes = ay_navigationItem.titleTextAttributes
                navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
}

// MARK: - UIScrollViewDelegate
extension DetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            let alpha = scrollView.contentOffset.y / CGFloat(176)
            ay_navigationBar.alpha = alpha
        } else {
            let alpha = -scrollView.contentOffset.y / ay_navigationBar.frame.maxY
            ay_navigationBar.alpha = alpha
        }
    }
}

// MARK: - SDCycleScrollViewDelegate
extension DetailViewController: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        let agrume = Agrume(images: images, startIndex: index, backgroundBlurStyle: .dark)
        agrume.statusBarStyle = .lightContent
        agrume.showFrom(self)
    }
}
