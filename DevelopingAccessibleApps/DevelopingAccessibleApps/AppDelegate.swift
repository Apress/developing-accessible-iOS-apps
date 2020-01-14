//
//  AppDelegate.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 07/04/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let accessibilityListViewController = AccessibilityExampleListViewController()

    lazy var navigationController = UINavigationController(rootViewController: accessibilityListViewController)

    func application(
        _ application: UIApplication,
        // (since this is Apple-defined, ignore the lint warning...)
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        accessibilityListViewController.delegate = self

        navigationController.navigationBar.prefersLargeTitles = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate: AccessibilityExampleListViewControllerDelegate {
    func selectedAccessibilityExample(_ accessibilityExample: AccessibilityExamplesDataSource) {
        navigationController.pushViewController(accessibilityExample.viewController(), animated: true)
    }
}
