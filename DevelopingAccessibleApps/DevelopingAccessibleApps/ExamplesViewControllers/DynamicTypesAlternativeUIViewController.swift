//
//  DynamicTypesAlternativeUIViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 12/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class DynamicTypesAlternativeUIViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageCellNib = UINib(nibName: ImageTableViewCell.identifier, bundle: nil)
        let alternativeCellNib = UINib(nibName: AlternativeImageTableViewCell.identifier, bundle: nil)

        tableView.register(imageCellNib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.register(alternativeCellNib, forCellReuseIdentifier: AlternativeImageTableViewCell.identifier)
        tableView.register(
            ImageCodeConstraintsTableViewCell.self, forCellReuseIdentifier: ImageCodeConstraintsTableViewCell.identifier
        )

        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}

extension DynamicTypesAlternativeUIViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell

        if indexPath.row.isMultiple(of: 2) {
            // https://developer.apple.com/documentation/uikit/uicontentsizecategory
            if traitCollection.preferredContentSizeCategory >= .accessibilityExtraExtraExtraLarge {
                cell = tableView.dequeueReusableCell(
                    withIdentifier: AlternativeImageTableViewCell.identifier, for: indexPath
                )
            } else {
                cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath)
            }
        } else {
            cell = tableView.dequeueReusableCell(
                withIdentifier: ImageCodeConstraintsTableViewCell.identifier, for: indexPath
            )
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DynamicTypesAlternativeUIViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
}
