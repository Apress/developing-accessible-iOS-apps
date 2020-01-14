//
//  SwitchTableViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 22/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class SwitchTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let simpleSwitchCellNib = UINib(nibName: SimpleSwitchTableViewCell.identifier, bundle: nil)
        let settingsSwitchCellNib = UINib(nibName: SettingsSwitchTableViewCell.identifier, bundle: nil)

        tableView.register(simpleSwitchCellNib, forCellReuseIdentifier: SimpleSwitchTableViewCell.identifier)
        tableView.register(settingsSwitchCellNib, forCellReuseIdentifier: SettingsSwitchTableViewCell.identifier)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.row.isMultiple(of: 2) {
            cell = tableView.dequeueReusableCell(withIdentifier: SettingsSwitchTableViewCell.identifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: SimpleSwitchTableViewCell.identifier, for: indexPath)
        }

        return cell
    }
}
