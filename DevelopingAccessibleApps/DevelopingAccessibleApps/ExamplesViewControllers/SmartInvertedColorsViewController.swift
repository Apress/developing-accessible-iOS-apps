//
//  SmartInvertedColorsViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 07/04/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class SmartInvertedColorsViewController: UIViewController {
    @IBOutlet weak var noSmartInvertColorLabel: UILabel!
    @IBOutlet weak var smartInvertColorLabel: UILabel!
    @IBOutlet weak var noSmartInvertColorImage: UIImageView!
    @IBOutlet weak var smartInvertColorImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        noSmartInvertColorLabel.text = NSLocalizedString("Without Smart Invert Colors", bundle: .main, comment: "")
        smartInvertColorLabel.text = NSLocalizedString("With Smart Invert Colors", bundle: .main, comment: "")

        noSmartInvertColorImage.image = UIImage(named: "Yosemite")
        smartInvertColorImage.image = UIImage(named: "Yosemite")

        configureAccessibility()
    }

    func configureAccessibility() {
        let accessibilityLabel = NSLocalizedString("Half Dome view from the Galcier Point", bundle: .main, comment: "")

        smartInvertColorImage.accessibilityIgnoresInvertColors = true

        noSmartInvertColorImage.isAccessibilityElement = true
        smartInvertColorImage.isAccessibilityElement = true

        noSmartInvertColorImage.accessibilityLabel = accessibilityLabel
        smartInvertColorImage.accessibilityLabel = accessibilityLabel
    }
}
