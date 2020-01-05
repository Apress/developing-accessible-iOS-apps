//
//  SwitchTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 22/06/2019.
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
        isAccessibilityElement = true
        settingTitleLabel.text = NSLocalizedString("Setting to switch on or off:", comment: "")
        settingSubtitleLabel.text = NSLocalizedString("Some explanation about what the setting does", comment: "")
        settingTitleLabel.numberOfLines = 0
        settingSubtitleLabel.numberOfLines = 0
    }
    
    override var accessibilityLabel: String? {
        get { "\(settingTitleLabel.accessibilityLabel ?? ""). \(settingSubtitleLabel.accessibilityLabel ?? "")" }
        set {}
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { settingSwitch.accessibilityTraits }
        set {}
    }
    
    override var accessibilityValue: String? {
        get { settingSwitch.accessibilityValue }
        set {}
    }
    
    override func accessibilityActivate() -> Bool {
        settingSwitch.isOn = !settingSwitch.isOn
        return true
    }
}
