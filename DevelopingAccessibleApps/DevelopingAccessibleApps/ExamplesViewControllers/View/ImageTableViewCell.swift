//
//  ImageTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 12/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    static let identifier = String(describing: ImageTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView.image = UIImage(named: "Yosemite")
//        pictureImageView.accessibilityIgnoresInvertColors = true
        titleLabel.text = String.loremImpsum()
    }
}
