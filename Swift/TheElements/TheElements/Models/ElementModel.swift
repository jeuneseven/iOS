//
//  ElementModel.swift
//  TheElements
//
//  Created by seven on 2025/9/10.
//

/**
 <dict>
     <key>atomicNumber</key>
     <integer>89</integer>
     <key>atomicWeight</key>
     <string>227</string>
     <key>discoveryYear</key>
     <string>1899 A.D.</string>
     <key>group</key>
     <integer>3</integer>
     <key>horizPos</key>
     <integer>4</integer>
     <key>name</key>
     <string>Actinium</string>
     <key>period</key>
     <integer>7</integer>
     <key>radioactive</key>
     <string>True</string>
     <key>state</key>
     <string>Solid</string>
     <key>symbol</key>
     <string>Ac</string>
     <key>vertPos</key>
     <integer>10</integer>
 </dict>
 */

import Foundation

struct ElementModel: Codable, Comparable {
    var atomicNumber: Int
    var atomicWeight: String
    var discoveryYear: String
    var group: Int
    var horizPos: Int
    var name: String
    var period: Int
    var radioactive: String
    var state: String
    var symbol: String
    var vertPos: Int
    
    static func <(lhs: ElementModel, rhs: ElementModel) -> Bool {
        return lhs.symbol < rhs.symbol
    }
}
