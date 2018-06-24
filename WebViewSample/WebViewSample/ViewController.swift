//
//  ViewController.swift
//  WebViewSample
//
//  Created by 王珏 on 2018/6/24.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        self.webView.loadRequest(request)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        NSLog("error:")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        NSLog(webView.stringByEvaluatingJavaScript(from: "document.body.innerHTML")!)
    }
}

