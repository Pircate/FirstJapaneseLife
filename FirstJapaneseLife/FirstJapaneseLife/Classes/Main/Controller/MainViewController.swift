//
//  MainViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var facilityButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 20)
        btn.setTitle("施設", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(facilityButtonAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var serviceButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 150, width: 100, height: 20)
        btn.setTitle("サービス", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(serviceButtonAction), for: .touchUpInside)
        return btn
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
    func addSubviews() {
        view.addSubview(facilityButton)
        view.addSubview(serviceButton)
    }

    // MARK: - action
    @objc func facilityButtonAction() {
        navigationController?.pushViewController(FacilityViewController(), animated: true)
    }
    
    @objc func serviceButtonAction() {
        navigationController?.pushViewController(ServiceViewController(), animated: true)
    }
}
