//
//  BaseViewController.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let backBtn = UIButton(type: .system)
        backBtn.frame = CGRect(x: 0, y: 0, width: 54, height: 44)
        backBtn.setTitle(LocalizableString.backButtonTitle, for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var homeButton: UIButton = {
        let homeBtn = UIButton(type: .system)
        homeBtn.frame = CGRect(x: 0, y: 0, width: 54, height: 44)
        homeBtn.setTitle(LocalizableString.homeButtonTitle, for: .normal)
        homeBtn.setTitleColor(.white, for: .normal)
        homeBtn.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        return homeBtn
    }()
    
    lazy var switchButton: UIButton = {
        let switchBtn = UIButton(type: .custom)
        switchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        switchBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        switchBtn.setTitle("日本语", for: .normal)
        switchBtn.setTitle("日本语", for: .highlighted)
        switchBtn.setTitle("中文", for: .selected)
        switchBtn.setTitle("中文", for: [.selected, .highlighted])
        switchBtn.setTitleColor(.white, for: .normal)
        switchBtn.isSelected = !LanguageManager.shared.isJapanese
        switchBtn.addTarget(self, action: #selector(switchButtonAction(sender:)), for: .touchUpInside)
        return switchBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(languageWillChange(sender:)), name: Notification.Name(kLanguageWillChangeNotification), object: nil)
        
        setupBaseAttribute()
        setupNavigationItem()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - private
    private func setupBaseAttribute() {
        view.backgroundColor = .white
        ay_navigationBar.backgroundColor = .global
        ay_navigationItem.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    private func setupNavigationItem() {
        
        ay_navigationItem.leftBarItems = [backButton, homeButton]
        ay_navigationItem.rightBarButton = switchButton
    }
    
    // MARK: - action
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func homeButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc private func switchButtonAction(sender: UIButton) {
        let title = sender.isSelected ? "是否切换为日语" : "中国語に切り替えるか"
        let cancelTitle = sender.isSelected ? "取消" : "キャンセル"
        let confirmTitle = sender.isSelected ? "确定" : "確定"
        alert(title: title, message: nil, cancelTitle: cancelTitle, otherTitles: [confirmTitle]) { (index) in
            if index == 1 {
                sender.isSelected = !sender.isSelected
                LanguageManager.shared.isJapanese = !sender.isSelected
                self.backButton.setTitle(LocalizableString.backButtonTitle, for: .normal)
                self.homeButton.setTitle(LocalizableString.homeButtonTitle, for: .normal)
            }
        }
    }
    
    //  MARK: - notification
    @objc func languageWillChange(sender: Notification) {
        
    }
}
