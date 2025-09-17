//
//  ViewController.swift
//  Debugging
//
//  Created by seven on 2025/8/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#file):\(#line) \(#function)")
        
        print(1, 2, 3, separator: "-")
        
        print("Some message", terminator: "?")
        
        assert(1 == 1, "Math failure!")
        assert(1 == 2, "Math failure!")
    }
}

