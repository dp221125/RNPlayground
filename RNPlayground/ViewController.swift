//
//  ViewController.swift
//  RNPlayground
//
//  Created by Milkyo on 11/13/24.
//

import UIKit
import React
import React_RCTAppDelegate

class ViewController: UIViewController {
    
    private var rootViewFactory: RCTRootViewFactory?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        let rootViewFactory = RCTRootViewFactory(configuration: configuration)
        self.rootViewFactory = rootViewFactory
        
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

@objc(NativeComponentManager)
final class ViewManager: RCTViewManager {
    override func view() -> UIView! {
        let viewController = NativeComponentViewController()
        return viewController.view
    }
}

final class NativeComponentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.addAction(
            UIAction { _ in
                let vc = UINavigationController(rootViewController: DetailViewController())
                vc.modalPresentationStyle = .automatic
                self.present(vc, animated: true)
            },
            for: .touchUpInside
        )
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
    }
    
    @objc func close() {
        self.dismiss(animated: true)
    }
}
