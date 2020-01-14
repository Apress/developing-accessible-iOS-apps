//
//  CustomToastView.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 05/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

final class CustomToastView: UIView, NibLoadable {
    @IBOutlet weak var toastTitleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 10.0
    }

    func configureWithTitle(_ title: String) {
        toastTitleLabel.text = title
        accessibilityLabel = toastTitleLabel.accessibilityLabel
    }
}
