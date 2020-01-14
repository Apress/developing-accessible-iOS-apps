//
//  DynamicTypesAdaptiveUIViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 02/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class DynamicTypesAdaptiveUIViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var callToActionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        iconImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        titleLabel.text = NSLocalizedString("Something went wrong!", bundle: .main, comment: "")
        descriptionLabel.text = NSLocalizedString(
            "It looks like we lost you there for a second. Please check your connection and try again",
            bundle: .main,
            comment: ""
        )
        callToActionButton.setTitle(NSLocalizedString("Retry", bundle: .main, comment: ""), for: .normal)

        let iconConfiguration = UIImage.SymbolConfiguration(textStyle: .largeTitle)

        iconImageView.image = UIImage(systemName: "xmark.octagon", withConfiguration: iconConfiguration)
        iconImageView.tintColor = .label
    }
}
