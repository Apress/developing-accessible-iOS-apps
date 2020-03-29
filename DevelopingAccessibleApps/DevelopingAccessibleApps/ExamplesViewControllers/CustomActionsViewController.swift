//
//  CustomActionsViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 05/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class CustomActionsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(nibName: SocialNetworkTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: SocialNetworkTableViewCell.identifier
        )
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SocialNetworkTableViewCell.identifier, for: indexPath
        ) as? SocialNetworkTableViewCell else { fatalError("Error creating the cell") }
        let viewModel = SocialNetworkViewModel(userName: "@a11yUser", postText: String.loremImpsum(withLength: .long))
        cell.configureWithViewModel(viewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
