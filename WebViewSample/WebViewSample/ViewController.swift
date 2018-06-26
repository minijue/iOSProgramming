//
//  ViewController.swift
//  WebViewSample
//
//  Created by 王珏 on 2018/6/24.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView:WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webView = WKWebView(frame:CGRect(x:10, y:200, width:self.view.bounds.width-20, height:self.view.bounds.height-210))
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testLoadHTMLString(_ sender: Any) {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl =  URL.init(fileURLWithPath: Bundle.main.bundlePath)
        
        do {
        let html = try String(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
        self.webView.loadHTMLString(html, baseURL: bundleUrl)
        } catch let error as NSError {
            NSLog(error.description)
        }      
        
    }
    
    @IBAction func testLoadRequest(_ sender: Any) {
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
        
        self.webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("didCommit")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinish")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("error :", error as NSError)
    }
}

