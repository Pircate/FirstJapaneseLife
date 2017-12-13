//
//  BaseViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - private
    private func setupNavigationItem() {
        
        let backBtn = UIButton(type: .system)
        backBtn.setTitle("上一页", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        let homeBtn = UIButton(type: .system)
        homeBtn.setTitle("起始页", for: .normal)
        homeBtn.setTitleColor(.black, for: .normal)
        homeBtn.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backBtn), UIBarButtonItem(customView: homeBtn)]
        
    }
    
    // MARK: - action
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func homeButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }

}
