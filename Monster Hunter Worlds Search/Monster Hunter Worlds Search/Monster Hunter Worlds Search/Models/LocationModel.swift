//
//  Locations.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import Foundation

struct Location: Identifiable, Codable {
    let id: Int
    let name: String
    let zoneCount: Int
    let camps: [Camp]
    
    struct Camp: Codable {
        let name: String
        let zone: Int
    }
}
