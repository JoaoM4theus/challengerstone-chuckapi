//
//  ChuckData.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import Foundation

struct Response: Codable {
    let result: [Result]
}

struct Result: Codable {
    let value: String?
    let url: String?
    let categories: [String]?
}
