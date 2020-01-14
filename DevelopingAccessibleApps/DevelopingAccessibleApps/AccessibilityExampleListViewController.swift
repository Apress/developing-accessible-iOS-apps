//
//  AccessibilityExampleListViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 07/04/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

protocol AccessibilityExampleListViewControllerDelegate: AnyObject {
    func selectedAccessibilityExample(_ accessibilityExample: AccessibilityExamplesDataSource)
}

class AccessibilityExampleListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    weak var delegate: AccessibilityExampleListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("accessibilityExamples", bundle: .main, comment: "")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = view.frame.size.height / 10.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(
            UINib(nibName: AccessibilityExampleTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: AccessibilityExampleTableViewCell.identifier
        )
    }
}

extension AccessibilityExampleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedAccessibilityExample = AccessibilityExamplesDataSource(rawValue: indexPath.row) else {
            return
        }

        delegate?.selectedAccessibilityExample(selectedAccessibilityExample)
    }
}

extension AccessibilityExampleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AccessibilityExamplesDataSource.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AccessibilityExampleTableViewCell.identifier, for: indexPath
        ) as? AccessibilityExampleTableViewCell else {
            fatalError("Couldn't load a valid cell")
        }
        cell.exampleTitleLabel?.text = AccessibilityExamplesDataSource(rawValue: indexPath.row)?.title()
        return cell
    }
}
