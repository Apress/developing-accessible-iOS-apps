//
//  AccessibilityNotificationsViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 05/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class AccessibilityNotificationsViewController: UIViewController {
    @IBOutlet weak var customModalButton: UIButton!
    @IBOutlet weak var customToastButton: UIButton!

    private var customToastView: CustomToastView?
    private var customModalView: CustomModalView?

    override func viewDidLoad() {
        super.viewDidLoad()

        customModalButton.setTitle(
            NSLocalizedString("Present Custom Modal (.screenChanged)", bundle: .main, comment: ""), for: .normal
        )
        customToastButton.setTitle(
            NSLocalizedString("Present Custom Toast (.announcement)", bundle: .main, comment: ""), for: .normal
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleReduceTransparency),
            name: UIAccessibility.reduceTransparencyStatusDidChangeNotification,
            object: nil
        )

        if let customModalView = CustomModalView.loadFromNib() {
            customModalView.accessibilityViewIsModal = true
            customModalView.dismissViewActioned = { self.dismissModalSheetView() }
            self.customModalView = customModalView
            view.addSubview(customModalView)
            hideModalSheetView()
        }

        if let customToastView = CustomToastView.loadFromNib() {
            customToastView.isAccessibilityElement = false
            customToastView.configureWithTitle(NSLocalizedString("Custom Toast Shown!", bundle: .main, comment: ""))
            customToastView.alpha = 0.0
            self.customToastView = customToastView
            view.addSubview(customToastView)
        }
    }

    @objc func handleReduceTransparency(_ sender: Any) {
        // Reduce transparency in your app if necessary
    }

    private func hideModalSheetView() {
        guard let customModalView = customModalView else { return }
        customModalView.frame = CGRect.zero
        customModalView.center = view.center
        customModalView.alpha = 0.0
    }

    private func showModalSheetViewToSize(_ size: CGSize) {
        guard let customModalView = customModalView else { return }
        customModalView.frame.size = size
        customModalView.center = self.view.center
        customModalView.alpha = 1.0
    }

    private func presentModalSheetview() {
        guard let customModalView = customModalView else { return }

        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.25,
            options: .curveEaseIn,
            animations: { self.showModalSheetViewToSize(CGSize(width: 300.0, height: 450.0)) },
            completion: { _ in
                UIAccessibility.post(notification: .screenChanged, argument: customModalView)
            }
        )
    }

    private func dismissModalSheetView() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.25,
            options: .curveEaseOut,
            animations: { self.hideModalSheetView() },
            completion: { _ in
                UIAccessibility.post(notification: .screenChanged, argument: self.customModalButton)
            }
        )
    }

    private func presentToastView() {
        guard let customToastView = customToastView else { return }
        customToastView.isHidden = false
        customToastView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
            customToastView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            customToastView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )

        UIView.animate(
            withDuration: 0.2,
            delay: 3.0,
            options: .curveEaseIn,
            animations: { customToastView.alpha = 1.0 },
            completion: { _ in
                let queueAnnouncementAttributes = [NSAttributedString.Key.accessibilitySpeechQueueAnnouncement: true]
                let announcementAttributedString = NSAttributedString(
                    string: customToastView.accessibilityLabel!, attributes: queueAnnouncementAttributes
                )

                UIAccessibility.post(notification: .announcement, argument: announcementAttributedString)
                UIView.animate(
                    withDuration: 0.2,
                    delay: 2.0,
                    options: .curveEaseOut,
                    animations: { customToastView.alpha = 0.0 },
                    completion: { _ in customToastView.isHidden = true }
                )
            }
        )
    }

    @IBAction private func customModalButtonPressed(_ sender: Any) {
        presentModalSheetview()
    }

    @IBAction private func customToastButtonPressed(_ sender: Any) {
        presentToastView()
    }
}
