//
//  AccessibilityElementsViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 20/07/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class AccessibilityElementsViewController: UIViewController {
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userProfileImage.layer.cornerRadius = userProfileImage.frame.size.height / 2
    }
}
