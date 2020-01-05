//
//  LargeContentViewerViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 16/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class LargeContentViewerViewController: UIViewController {
    @IBOutlet weak var customBarView: UIView!
    @IBOutlet weak var customBarButton: UIButton!
    @IBOutlet weak var customBarTabView: UIView!
    @IBOutlet weak var customBarTabImage: UIImageView!
    @IBOutlet weak var customBarTabLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videosTitle = NSLocalizedString("Videos", comment: "")
        let videosImage = UIImage(systemName: "play",
                                  withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large))
        let largeContentViewerInteraction = UILargeContentViewerInteraction()
        
        customBarTabImage.image = videosImage
        customBarTabLabel.text = videosTitle
        customBarView.addInteraction(largeContentViewerInteraction)
        customBarButton.setImage(videosImage, for: .normal)
        customBarButton.showsLargeContentViewer = true
        customBarTabView.showsLargeContentViewer = true
        customBarTabView.largeContentImage = videosImage
        customBarTabView.largeContentTitle = videosTitle
    }
}
