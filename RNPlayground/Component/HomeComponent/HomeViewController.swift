//
//  HomeViewController.swift
//  RNPlayground
//
//  Created by Milkyo on 11/14/24.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    private lazy var button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.layout()
    }

    private func attribute() {
        self.view.backgroundColor = .systemBackground
        self.button.setTitle("Show Detail", for: .normal)

        let buttonAction: UIAction = UIAction { [weak self] _ in
            guard let self else { return }
            let detailViewController = UINavigationController(rootViewController: DetailViewController())
            detailViewController.modalPresentationStyle = .pageSheet
            self.present(detailViewController, animated: true)
        }

        self.button.addAction(buttonAction, for: .touchUpInside)
    }

    private func layout() {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
