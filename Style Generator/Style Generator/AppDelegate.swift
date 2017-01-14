//
//  AppDelegate.swift
//  Style Generator
//
//  Created by Ahmed Khalaf on 14/12/16.
//  Copyright © 2016 Ahmed Khalaf. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let primaryColorViewController = ColorViewController(colors: MaterialColor.primaryColors)
//        let colors = [MaterialColor.brown, MaterialColor.amber]
//        let secondaryColorViewController = ColorViewController(colors: colors)
        
        let navigationViewController = UINavigationController(rootViewController: primaryColorViewController)
        
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

