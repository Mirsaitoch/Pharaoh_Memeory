//
//  PrivacyPolicyViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 3/4/23.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController,  WKNavigationDelegate {
    
    @IBOutlet var navBarTitle: UINavigationItem!
    
    @IBOutlet var webView: WKWebView!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        webView.addGestureRecognizer(panGesture)
        
    }
    
    
    @objc func panGestureAction(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: webView)
        let velocity = gesture.velocity(in: webView)
        
        if translation.x > 0 && velocity.x > 500 && webView.canGoBack {
            webView.goBack()
        }
        if translation.x < 0 && velocity.x < -500 && webView.canGoForward {
                    webView.goForward()
            }
    }
}
