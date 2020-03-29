//
//  ImageCodeConstraintsTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 30/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class ImageCodeConstraintsTableViewCell: UITableViewCell {
    static let identifier = String(describing: ImageCodeConstraintsTableViewCell.self)

    private var pictureImageView: UIImageView?
    private var titleLabel: UILabel?
    private var commonConstraints: [NSLayoutConstraint] = []
    private var defaultConstraints: [NSLayoutConstraint] = []
    private var alternativeConstraints: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let isAccessibilityCategory = traitCollection.preferredContentSizeCategory.isAccessibilityCategory
        if isAccessibilityCategory != previousTraitCollection?.preferredContentSizeCategory.isAccessibilityCategory {
            updateLayoutConstraints()
        }
    }

    private func configureLayout() {
        titleLabel = UILabel(frame: CGRect.zero)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.numberOfLines = 0
        titleLabel?.text = String.loremImpsum()
        pictureImageView = UIImageView(image: UIImage(named: "Yosemite"))
        pictureImageView?.contentMode = .scaleAspectFill
        pictureImageView?.clipsToBounds = true
        pictureImageView?.accessibilityIgnoresInvertColors = true

        backgroundColor = .lightGray

        if let titleLabel = titleLabel,
            let pictureImageView = pictureImageView {
            contentView.addSubview(pictureImageView)
            contentView.addSubview(titleLabel)
            setupLayoutConstraints()
            updateLayoutConstraints()
        }
    }

    private func setupLayoutConstraints() {
        guard let titleLabel = titleLabel else { return }
        guard let pictureImageView = pictureImageView else { return }

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentCompressionResistancePriority(.init(250.0), for: .vertical)
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.setContentCompressionResistancePriority(.required, for: .vertical)

        commonConstraints = [
            NSLayoutConstraint(
                item: pictureImageView,
                attribute: .width,
                relatedBy: .equal,
                toItem: pictureImageView,
                attribute: .height,
                multiplier: 16.0 / 9.0,
                constant: 0
            ),
            pictureImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            pictureImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.layoutMarginsGuide.bottomAnchor)
        ]

        defaultConstraints = [
            pictureImageView.heightAnchor.constraint(equalToConstant: 100),
            pictureImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10.0),
            titleLabel.topAnchor.constraint(equalTo: pictureImageView.topAnchor)
        ]

        alternativeConstraints = [
            pictureImageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            pictureImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor)
        ]
    }

    private func updateLayoutConstraints() {
        NSLayoutConstraint.activate(commonConstraints)
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            NSLayoutConstraint.deactivate(defaultConstraints)
            NSLayoutConstraint.activate(alternativeConstraints)
        } else {
            NSLayoutConstraint.deactivate(alternativeConstraints)
            NSLayoutConstraint.activate(defaultConstraints)
        }
    }
}
