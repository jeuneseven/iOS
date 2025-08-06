//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by seven on 2025/8/6.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
