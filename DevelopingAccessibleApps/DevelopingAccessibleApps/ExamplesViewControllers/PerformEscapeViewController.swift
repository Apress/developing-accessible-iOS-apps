//
//  PerformEscapeViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 04/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class PerformEscapeViewController: UIViewController {
    @IBOutlet weak var presentWithPerformEscapeButton: UIButton!
    @IBOutlet weak var presentWithoutPerformEscapeButton: UIButton!
    
    let withPerformEscapeNavigationController = UINavigationController()
    let withoutPerformEscapeNavigationController = UINavigationController()
    let withPerformEscapeViewController = WithPerformEscapeViewController()
    let withoutPerformEscapeViewController = WithoutPerformEscapeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeButton = UIBarButtonItem(title: NSLocalizedString("Close", comment: ""), style: .plain, target: self, action: #selector(dismissModalView))
        
        presentWithPerformEscapeButton.setTitle(NSLocalizedString("Present Modal with Perform Escape", comment: ""), for: .normal)
        presentWithoutPerformEscapeButton.setTitle(NSLocalizedString("Present Modal without Perform Escape", comment: ""), for: .normal)
        
        withPerformEscapeViewController.navigationItem.rightBarButtonItem = closeButton
        withoutPerformEscapeViewController.navigationItem.rightBarButtonItem = closeButton
        
        withPerformEscapeNavigationController.viewControllers = [withPerformEscapeViewController]
        withoutPerformEscapeNavigationController.viewControllers = [withoutPerformEscapeViewController]
    }
    
    @objc
    private func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func presentWithPerformEscapeButtonPressed(_ sender: Any) {
        present(withPerformEscapeNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func presentWithoutPerformEscapeButtonPressed(_ sender: Any) {
        present(withoutPerformEscapeNavigationController, animated: true, completion: nil)
    }
}

class WithPerformEscapeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func accessibilityPerformEscape() -> Bool {
        super.accessibilityPerformEscape()
        dismiss(animated: true, completion: nil)
        return true
    }
}

class WithoutPerformEscapeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}
