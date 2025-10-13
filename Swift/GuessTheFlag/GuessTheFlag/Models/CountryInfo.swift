//
//  CountryInfo.swift
//  GuessTheFlag
//
//  Created by seven on 2025/8/27.
//

import Foundation
// {"cn":"阿富汗","en":"Afghanistan","full":"the Islamic Republic of Afghanistan","abb2":"AF","abb3":"AFG","code":"004"}
struct CountryInfo: Codable {
    let cn: String
    let en: String
    let full: String
    let abb2: String
    let abb3: String
    let code: String
}
