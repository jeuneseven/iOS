//
//  DetailViewController.swift
//  WhitehousePetitions
//
//  Created by seven on 2025/8/7.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webview: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webview = WKWebView()
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body {
        font-size: 150%;
        } </style>
        <head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        webview.loadHTMLString(html, baseURL: nil)
    }

}
