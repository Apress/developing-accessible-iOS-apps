//
//  SettingsSwitchTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 30/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class SettingsSwitchTableViewCell: UITableViewCell {
    static let identifier = String(describing: SettingsSwitchTableViewCell.self)

    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var settingSubtitleLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingTitleLabel.text = NSLocalizedString("Title for a setting option", comment: "")
        settingSubtitleLabel.text = NSLocalizedString("Explanation of what this setting option does", comment: "")
        isAccessibilityElement = true
    }
    
    override var accessibilityLabel: String? {
        get { return "\(settingTitleLabel.accessibilityLabel ?? ""). \(settingSubtitleLabel.accessibilityLabel ?? "")" }
        set {}
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { return settingSwitch.accessibilityTraits }
        set {}
    }
    
    override var accessibilityValue: String? {
        get { return settingSwitch.accessibilityValue }
        set {}
    }
    
    override func accessibilityActivate() -> Bool {
        settingSwitch.isOn = !settingSwitch.isOn
        return true
    }

}
