//
//  RaterView.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 20/07/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class RaterButton: UIButton {
    func toggle(_ isOn: Bool) {
        alpha = isOn ? 1.0 : 0.5
    }
}

class RaterView: UIView {
    private let stackView = UIStackView()
    private var icon = UIImage(systemName: "hand.thumbsup")
    private var maxScore: UInt = 5

    var rating: UInt = 0 {
        didSet {
            updateAccessibilityValue()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        NSLayoutConstraint.activate(
            [
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )

        for _ in 0..<maxScore {
            let ratingButton = RaterButton(type: .system)
            ratingButton.setImage(icon, for: .normal)
            ratingButton.addTarget(self, action: #selector(ratingButtonPressed(_:)), for: .touchUpInside)
            ratingButton.toggle(false)
            ratingButton.imageView?.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(ratingButton)
        }

        pressButton(at: 0)

        isAccessibilityElement = true
        accessibilityTraits = UIAccessibilityTraits.adjustable

        backgroundColor = .systemBackground
        stackView.backgroundColor = .systemBackground
    }

    @objc
    private func ratingButtonPressed(_ sender: RaterButton) {
        var selectedIndex = stackView.arrangedSubviews.count

        for (index, arrangedSubview) in stackView.arrangedSubviews.enumerated() {
            guard let arrangedSubview = arrangedSubview as? RaterButton else { break }

            if arrangedSubview == sender {
                selectedIndex = index
                rating = UInt(selectedIndex)
            }

            if index <= selectedIndex {
                arrangedSubview.toggle(true)
            } else {
                arrangedSubview.toggle(false)
            }
        }
    }

    override func accessibilityIncrement() {
        guard rating < maxScore else { return }
        pressButton(at: rating + 1)
    }

    override func accessibilityDecrement() {
        guard rating > 0 else { return }
        pressButton(at: rating - 1)
    }

    private func pressButton(at index: UInt) {
        guard let button = button(at: index) else { return }
        ratingButtonPressed(button)
    }

    private func button(at index: UInt) -> RaterButton? {
        var button: RaterButton?

        for (subviewIndex, arrangedSubview) in stackView.arrangedSubviews.enumerated() {
            guard let arrangedSubview = arrangedSubview as? RaterButton else { break }

            if index == subviewIndex {
                button = arrangedSubview
                break
            }
        }

        return button
    }

    private func updateAccessibilityValue() {
        accessibilityValue = "\(rating + 1)"
    }
}
