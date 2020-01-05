//
//  SocialNetworkTableViewCell.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 05/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class SocialNetworkTableViewCell: UITableViewCell {
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    static let identifier = String(describing: SocialNetworkTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let repostTitle = NSLocalizedString("Repost", comment: "")
        let likeTitle = NSLocalizedString("Like", comment: "")
        let shareTitle = NSLocalizedString("Share", comment: "")
        
        repostButton.setTitle(repostTitle, for: .normal)
        likeButton.setTitle(likeTitle, for: .normal)
        shareButton.setTitle(shareTitle, for: .normal)
        
        postLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        accessibilityCustomActions = [UIAccessibilityCustomAction(name: repostTitle, target: self, selector: #selector(userButtonPressed(_:))),
        UIAccessibilityCustomAction(name: likeTitle, target: self, selector: #selector(likeButtonPressed(_:))),
        UIAccessibilityCustomAction(name: shareTitle, target: self, selector: #selector(shareButtonPressed(_:)))]
    }
    
    func configureWithViewModel(_ viewModel: SocialNetworkViewModel) {
        self.userButton.setTitle(viewModel.userName, for: .normal)
        self.postLabel.text = viewModel.postText
        
        if UIAccessibility.isVoiceOverRunning,
            let userAccessibilityLabel = userButton.accessibilityLabel,
            let postAccessibilityLabel = postLabel.accessibilityLabel {
            accessibilityLabel = "\(String(describing: userAccessibilityLabel)). \(String(describing: postAccessibilityLabel))"
            accessibilityCustomActions?.append(UIAccessibilityCustomAction(name: viewModel.userName, target: self, selector: #selector(userButtonPressed(_:))))
        }
    }
    
    // TODO: Create custom action selectors properly
    @objc func handleAction(_ action: UIAccessibilityCustomAction) -> Bool { return true }
    
    @IBAction func userButtonPressed(_ sender: Any) {
        print("User button presed")
    }
    
    @IBAction func repostButtonPressed(_ sender: Any) {
        print("Repost button presed")
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        print("Like button presed")
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        print("Share button presed")
    }
}

struct SocialNetworkViewModel {
    let userName: String
    let postText: String
}
