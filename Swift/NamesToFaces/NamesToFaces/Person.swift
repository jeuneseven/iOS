//
//  Person.swift
//  NamesToFaces
//
//  Created by seven on 2025/8/8.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
