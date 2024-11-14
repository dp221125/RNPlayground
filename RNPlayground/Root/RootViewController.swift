//
//  RootViewController.swift
//  RNPlayground
//
//  Created by Milkyo on 11/13/24.
//

import React
import React_RCTAppDelegate
import UIKit

final class RootViewController: UIViewController {
    private let rootViewFactory: RCTRootViewFactory

    init() {
        let configuration = RCTRootViewFactoryConfiguration(
            bundleURLBlock: {
                #if DEBUG
                    return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
                #else
                    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
                #endif
            },
            newArchEnabled: true,
            turboModuleEnabled: true,
            bridgelessEnabled: true
        )
        self.rootViewFactory = RCTRootViewFactory(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootView = rootViewFactory.view(
            withModuleName: "playground",
            initialProperties: nil,
            launchOptions: [:]
        )

        self.view.addSubview(rootView)

        rootView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
