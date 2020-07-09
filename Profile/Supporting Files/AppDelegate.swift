//
//  AppDelegate.swift
//  Profile
//
//  Created by Denis Abramov on 30.06.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        var backButtonImage = UIImage(named: "arrow.left")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 0,
                                                            topCapHeight: 0)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage,
                                                                  for: .normal, barMetrics: .default)
        UINavigationBar.appearance().tintColor = UIColor.clear
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
