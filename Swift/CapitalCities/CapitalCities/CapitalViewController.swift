//
//  CapitalViewController.swift
//  CapitalCities
//
//  Created by seven on 2025/8/10.
//

import UIKit
import WebKit

class CapitalViewController: UIViewController {
    var webview: WKWebView!
    var capital: Capital?
    
    override func loadView() {
        webview = WKWebView()
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let capitalTitle = capital?.title else { return }
        
        webview.load(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/\(capitalTitle)")!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
