//
//  AppDelegate.swift
//  Day08_HomeWork
//
//  Created by Vu Nam Ha on 17/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
                let homeVC = BallDownNatureViewController()
                window?.rootViewController = homeVC
                window?.makeKeyAndVisible()
        return true
    }

    

    

}

