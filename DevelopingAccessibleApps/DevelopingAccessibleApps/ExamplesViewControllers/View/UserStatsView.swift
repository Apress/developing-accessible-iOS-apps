//
//  UserStatsView.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 20/07/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class UserStatsView: UIStackView {
    @IBOutlet weak var followersHeadingLabel: UILabel!
    @IBOutlet weak var followersNumberLabel: UILabel!
    @IBOutlet weak var followingHeadingLabel: UILabel!
    @IBOutlet weak var followingNumberLabel: UILabel!
    @IBOutlet weak var postsHeadingLabel: UILabel!
    @IBOutlet weak var postsNumberLabel: UILabel!
    @IBOutlet weak var followersStackView: UIStackView!
    @IBOutlet weak var followingStackView: UIStackView!
    @IBOutlet weak var postsStackView: UIStackView!

    // SwiftLint doesn’t normally like types like `[Any]?`.
    // But, since we’re inheriting here, we need to use it.
    // swiftlint:disable discouraged_optional_collection

    private var _accessibilityElements: [Any]?

    override var accessibilityElements: [Any]? {
        set {
            _accessibilityElements = newValue
        }

        get {
            if let _accessibilityElements = _accessibilityElements {
                return _accessibilityElements
            }

            var elements = [UIAccessibilityElement]()
            let followersAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
            let followingAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
            let postsAccessibilityElement = UIAccessibilityElement(accessibilityContainer: self)

            followersAccessibilityElement.accessibilityLabel = "\(followersHeadingLabel.accessibilityLabel!), " +
                "\(followersNumberLabel.accessibilityLabel!)"
            followersAccessibilityElement.accessibilityFrameInContainerSpace = followersStackView
                .convert(followersHeadingLabel.frame, to: self)
                .union(followersStackView.convert(followersNumberLabel.frame, to: self))
            elements.append(followersAccessibilityElement)

            followingAccessibilityElement.accessibilityLabel = "\(followingHeadingLabel.accessibilityLabel!), " +
                "\(followingNumberLabel.accessibilityLabel!)"
            followingAccessibilityElement.accessibilityFrameInContainerSpace = followingStackView
                .convert(followingHeadingLabel.frame, to: self)
                .union(followingStackView.convert(followingNumberLabel.frame, to: self))
            elements.append(followingAccessibilityElement)

            postsAccessibilityElement.accessibilityLabel = "\(postsHeadingLabel.accessibilityLabel!), " +
                "\(postsNumberLabel.accessibilityLabel!)"
            postsAccessibilityElement.accessibilityFrameInContainerSpace = postsStackView
                .convert(postsHeadingLabel.frame, to: self)
                .union(postsStackView.convert(postsNumberLabel.frame, to: self))
            elements.append(postsAccessibilityElement)

            _accessibilityElements = elements

            followersHeadingLabel.numberOfLines = 0
            followingHeadingLabel.numberOfLines = 0
            postsHeadingLabel.numberOfLines = 0

            return _accessibilityElements
        }
    }
}
