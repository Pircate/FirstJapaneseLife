//
//  DetailViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

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

    // MARK: life cycle
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
            make.edges.equalToSuperview()
        }

        setupTableHeaderView()
    }

    private func setupTableHeaderView() {
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 240))
        headerView.image = UIImage(named: "detail_header")
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
            return 3
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell: ServiceChildTextCell = tableView.dequeueReusableCell(withIdentifier: "ServiceChildTextCell") as! ServiceChildTextCell
            cell.textView.text = """
            初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活
            初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活初めての日本生活
            初めての日本生活初めての日本生活初めての日本生活初めての日本生活
            """
            return cell
        case 1:
            let cell: DetailAddressCell = tableView.dequeueReusableCell(withIdentifier: "DetailAddressCell") as! DetailAddressCell
            cell.leftLabel.text = ["地址", "电话", "营业时间"][indexPath.row]
            cell.rightLabel.text = ["日本埼玉县南埼玉郡宫代町学园台4-1\n256465", "45646622", "9:00-18:00"][indexPath.row]
            return cell
        default:
            let cell: DetailMapCell = tableView.dequeueReusableCell(withIdentifier: "DetailMapCell") as! DetailMapCell
            CLGeocoder().geocodeAddressString("埼玉県南埼玉郡宫代町学园台", completionHandler: { (placemarks, error) in
                if let marks = placemarks {
                    if marks.count > 0 {
                        let placemark = marks.first
                        if let coordinate = placemark?.location?.coordinate {
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = coordinate
                            cell.mapView.showAnnotations([annotation], animated: true)
                            self.tableView.reloadData()
                        }
                    }
                }
            })
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
        header.titleLabel.text = ["介绍", "位置", "地图"][section]
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180
        case 1:
            if indexPath.row > 0 {
                return 44
            }
            return 54
        default:
            return 240
        }
    }
}

// MARK: - UIScrollViewDelegate
extension DetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            let alpha = scrollView.contentOffset.y / CGFloat(176)
            ay_navigationBar.alpha = alpha
        }
        else {
            let alpha = -scrollView.contentOffset.y / ay_navigationBar.frame.maxY
            ay_navigationBar.alpha = alpha
        }
    }
}
