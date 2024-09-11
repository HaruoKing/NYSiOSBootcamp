//
//  Monster.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import Foundation

struct Monster: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let species: String
    let description: String
    let elements: [String]
    let weaknesses: [Weakness]
    let icon: String?
    
    struct Weakness: Codable {
        let element: String
        let stars: Int
    }
}
