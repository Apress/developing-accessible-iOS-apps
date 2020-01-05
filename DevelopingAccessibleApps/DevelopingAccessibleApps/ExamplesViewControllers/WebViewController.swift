//
//  WebViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 30/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let baseURL = Bundle.main.resourceURL {
            let fileURL = baseURL.appendingPathComponent("dynamic-type-example.html")
            webView?.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(contentSizeCategoryDidChange(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc private func contentSizeCategoryDidChange(_ notification: Notification) {
        webView?.reload()
    }
}
