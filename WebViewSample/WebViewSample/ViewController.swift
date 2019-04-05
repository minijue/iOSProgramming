//
//  ViewController.swift
//  WebViewSample
//
//  Created by 王珏 on 2019/4/2.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.webView = WKWebView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(self.webView)
    }

    @IBAction func textLoadHTMLString(sender: AnyObject) {  // 打开本地的index.html页面
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL.init(fileURLWithPath: Bundle.main.bundlePath)
        
        do {
            let html = try String(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
            self.webView.loadHTMLString(html, baseURL: bundleUrl)
        } catch _ as NSError {}
    }
    
    @IBAction func testLoadRequest(sender: AnyObject) { // 异步加载
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        
        self.webView.load(request)
        self.webView.navigationDelegate = self
    }
    
    // WKNavigationDelegate 实现
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("didCommit navigation")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinish navigation")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("didFailProvisionalNavigation")
    }
}

