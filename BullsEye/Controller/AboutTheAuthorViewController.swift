//
//  AboutTheAuthorViewController.swift
//  BullsEye
//
//  Created by halil ibrahim baykan on 24/08/2020.
//  Copyright © 2020 halil ibrahim baykan. All rights reserved.
//

import UIKit
import WebKit


class AboutTheAuthor: UIViewController,WKUIDelegate{

    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://halil-ibrahim-baykan.netlify.app")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        setNavigationBar()
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }

    @objc func done() { // remove @objc for Swift 3
        dismiss(animated: true, completion: nil)
    }
    
    
//    @IBAction func backButtonClicked(){
//        dismiss(animated: true, completion: nil)
//    }
    
    
}
