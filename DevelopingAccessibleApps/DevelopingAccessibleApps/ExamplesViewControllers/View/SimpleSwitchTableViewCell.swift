//
//  SimpleSwitchTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 22/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class SimpleSwitchTableViewCell: UITableViewCell {
    static let identifier = String(describing: SimpleSwitchTableViewCell.self)
   
    @IBOutlet weak var settingTitleLabel: UILabel!
    
    override func awakeFromNib() {
        settingTitleLabel.text = NSLocalizedString("Not a good exaple", comment: "")
    }
}
