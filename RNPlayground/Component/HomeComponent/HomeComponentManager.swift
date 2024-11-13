//
//  HomeComponentManager.swift
//  RNPlayground
//
//  Created by Milkyo on 11/14/24.
//

import Foundation
import React

@objc(HomeComponentManager)
final class HomeViewManager: RCTViewManager {
    var viewController: HomeViewController?

    override func view() -> UIView! {
        if let viewController {
            return viewController.view
        }

        let viewController = HomeViewController()
        self.viewController = viewController
        return viewController.view
    }
}
