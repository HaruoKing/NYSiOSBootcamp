//
//  Weapon.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/30/24.
//

import Foundation

struct Weapon: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let rarity: Int
    let attack: Attack
    let attributes: Attributes
    
    struct Attack: Codable {
        let display: Int
    }
    
    struct Attributes: Codable {
        let damageType: String?
        let elderseal: String?
    }
}
