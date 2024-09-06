//
//  Skills.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import Foundation

struct Skill: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let ranks: [Rank]
    
    struct Rank: Codable {
        let level: Int
        let description: String
        let skillModifiers: SkillModifiers?
    }
    
    struct SkillModifiers: Codable {
        let affinity: Int?
        let attack: Int?
        let defense: Int?
    }
}
