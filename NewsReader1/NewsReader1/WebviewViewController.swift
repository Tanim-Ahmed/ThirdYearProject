//
//  WebviewViewController.swift
//  NewsReader1
//
//  Created by cse on 11/7/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    
    @IBOutlet weak var webview: UIWebView!
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webview.loadRequest(URLRequest(url: URL(string: url!)!))
    }

  

}
