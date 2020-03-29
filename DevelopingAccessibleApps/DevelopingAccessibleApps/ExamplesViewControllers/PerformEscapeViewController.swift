//
//  PerformEscapeViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 04/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

/// Example for:
/// Chapter 4. VoicOver – Up to 11
/// -> Advanced VoiceOver gestures
/// -> Perform Escape
class PerformEscapeViewController: UIViewController {
    @IBOutlet weak var presentWithPerformEscapeButton: UIButton!
    @IBOutlet weak var presentWithoutPerformEscapeButton: UIButton!

    let withPerformEscapeNavigationController = UINavigationController()
    let withoutPerformEscapeNavigationController = UINavigationController()
    let withPerformEscapeViewController = WithPerformEscapeViewController()
    let withoutPerformEscapeViewController = WithoutPerformEscapeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let closeButton = UIBarButtonItem(
            title: NSLocalizedString("Close", bundle: .main, comment: ""),
            style: .plain,
            target: self,
            action: #selector(dismissModalView)
        )

        presentWithPerformEscapeButton.setTitle(
            NSLocalizedString("Present Modal with Perform Escape", bundle: .main, comment: ""), for: .normal
        )
        presentWithoutPerformEscapeButton.setTitle(
            NSLocalizedString("Present Modal without Perform Escape", bundle: .main, comment: ""), for: .normal
        )

        withPerformEscapeViewController.navigationItem.rightBarButtonItem = closeButton
        withoutPerformEscapeViewController.navigationItem.rightBarButtonItem = closeButton

        // provide context for the user about whether the Perform Escape action should work or not
        withPerformEscapeViewController.navigationItem.title = "with Perform Escape"
        withoutPerformEscapeViewController.navigationItem.title = "without Perform Escape"

        withPerformEscapeNavigationController.viewControllers = [withPerformEscapeViewController]
        withoutPerformEscapeNavigationController.viewControllers = [withoutPerformEscapeViewController]
    }

    @objc
    private func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func presentWithPerformEscapeButtonPressed(_ sender: Any) {
        present(withPerformEscapeNavigationController, animated: true, completion: nil)
    }

    @IBAction private func presentWithoutPerformEscapeButtonPressed(_ sender: Any) {
        present(withoutPerformEscapeNavigationController, animated: true, completion: nil)
    }
}

class WithPerformEscapeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
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
