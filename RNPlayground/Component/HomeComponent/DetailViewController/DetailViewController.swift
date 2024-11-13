//
//  DetailViewController.swift
//  RNPlayground
//
//  Created by Milkyo on 11/14/24.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
    }

    private func attribute() {
        self.view.backgroundColor = .systemBackground

        let rightBarButtonAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }

        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            primaryAction: rightBarButtonAction
        )

        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
