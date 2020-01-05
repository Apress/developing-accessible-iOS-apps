//
//  CustomModalView.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 04/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

final class CustomModalView: UIView, NibLoadable {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    var dismissViewActioned: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyTextLabel.text = NSLocalizedString("Hello custom modal view!", comment: "")
        closeButton.setTitle(NSLocalizedString("Close", comment: ""), for: .normal)
        layer.cornerRadius = 10.0
    }
    
    override func accessibilityPerformEscape() -> Bool {
        super.accessibilityPerformEscape()
        dismissViewActioned?()
        return true
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismissViewActioned?()
    }
}
