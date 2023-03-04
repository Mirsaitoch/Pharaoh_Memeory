//
//  PrivacyPolicyViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 3/4/23.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController,  WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        }
    }
