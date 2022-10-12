//
//  AppDelegate.swift
//  JsonParser
//
//  Created by Raheel Ahmed on 04/10/2022.
//

import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let empVC = EmployeeVC()
        empVC.service = .init(input: .init(url: "https://mocki.io/v1/51b4858b-094a-45d0-b46a-89b98da24c8f"))
        window?.rootViewController = empVC
        return true
    }

}

