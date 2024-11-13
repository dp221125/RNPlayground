//
//  AppDelegate.swift
//  RNPlayground
//
//  Created by Milkyo on 11/13/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = RootViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
