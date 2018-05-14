//
//  AppDelegate.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/13.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import EachNavigationBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UIViewController.setupNavigationBar
        LanguageManager.shared.isJapanese = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let nav = UINavigationController(rootViewController: MainViewController())
        nav.navigation.configuration.isEnabled = true
        nav.navigation.configuration.isTranslucent = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
