//
//  ViewController.swift
//  AutoLayout
//
//  Created by seven on 2025/8/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label1 = createLabel(string: "THESE", color: .red)
        
        let label2 = createLabel(string: "ARE", color: .cyan)
        
        let label3 = createLabel(string: "SOME", color: .yellow)
        
        let label4 = createLabel(string: "AWESOME", color: .green)
        
        let label5 = createLabel(string: "LABELS", color: .orange)
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        let viewsArray = [label1, label2, label3, label4, label5]
        
        
//        let viewsDictionary = [
//            "label1" : label1,
//            "label2" : label2,
//            "label3" : label3,
//            "label4" : label4,
//            "label5" : label5,
//        ]
//        
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]", options: [], metrics: nil, views: viewsDictionary))
//        }
//        
//        let metrics = ["labelHeight" : 88]
//        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        var previous: UILabel?
        
        for label in viewsArray {
//            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//            label.heightAnchor.constraint(equalToConstant: 60).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1 / 5, constant: -10).isActive = true
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }
    }

    func createLabel(string: String, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = color
        label.text = string
        label.sizeToFit()
        
        return label
    }
}

