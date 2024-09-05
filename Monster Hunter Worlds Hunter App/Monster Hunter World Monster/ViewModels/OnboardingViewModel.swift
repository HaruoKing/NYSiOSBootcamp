//
//  OnboardingViewModel.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var monsters: [Monster] = []
    @Published var locations: [Location] = []
    @Published var weapons: [Weapon] = []
    @Published var skills: [Skill] = []
    
    func fetchDataFromAPI() {
        Task {
            do {
                async let monsters = downloadMonstersData()
                async let locations = downloadLocationsData()
                async let weapons = downloadWeaponsData()
                async let skills = downloadSkillsData()
                
                let (fetchedMonsters, fetchedLocations, fetchedWeapons, fetchedSkills) = try await (monsters, locations, weapons, skills)
                
                DispatchQueue.main.async {
                    self.monsters = fetchedMonsters
                    self.locations = fetchedLocations
                    self.weapons = fetchedWeapons
                    self.skills = fetchedSkills
                    self.isLoading = false
                }
                
                saveDataToPlist(monsters: fetchedMonsters)
                saveLocationsToPlist(locations: fetchedLocations)
                saveWeaponsToPlist(weapons: fetchedWeapons)
                saveSkillsToPlist(skills: fetchedSkills)
                
            } catch {
                DispatchQueue.main.async {
                    print("Failed to download data: \(error)")
                    self.isLoading = false
                }
            }
        }
    }
    
    private func downloadMonstersData() async throws -> [Monster] {
        let url = URL(string: "https://mhw-db.com/monsters")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let monsters = try JSONDecoder().decode([Monster].self, from: data)
        return monsters
    }
    
    private func downloadLocationsData() async throws -> [Location] {
        let url = URL(string: "https://mhw-db.com/locations")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations
    }
    
    private func downloadWeaponsData() async throws -> [Weapon] {
        let url = URL(string: "https://mhw-db.com/weapons")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let weapons = try JSONDecoder().decode([Weapon].self, from: data)
        return weapons
    }
    
    private func downloadSkillsData() async throws -> [Skill] {
        let url = URL(string: "https://mhw-db.com/skills")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let skills = try JSONDecoder().decode([Skill].self, from: data)
        return skills
    }
    
    private func saveDataToPlist(monsters: [Monster]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(monsters)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let plistPath = documentDirectory.appendingPathComponent("monsters.plist")
            try plistData.write(to: plistPath)
            print("Monsters data successfully saved to \(plistPath)")
        } catch {
            print("Error encoding monsters data to plist: \(error)")
        }
    }
    
    private func saveLocationsToPlist(locations: [Location]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(locations)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let plistPath = documentDirectory.appendingPathComponent("locations.plist")
            try plistData.write(to: plistPath)
            print("Locations data successfully saved to \(plistPath)")
        } catch {
            print("Error encoding locations data to plist: \(error)")
        }
    }
    
    private func saveWeaponsToPlist(weapons: [Weapon]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(weapons)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let plistPath = documentDirectory.appendingPathComponent("weapons.plist")
            try plistData.write(to: plistPath)
            print("Weapons data successfully saved to \(plistPath)")
        } catch {
            print("Error encoding weapons data to plist: \(error)")
        }
    }
    
    private func saveSkillsToPlist(skills: [Skill]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(skills)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let plistPath = documentDirectory.appendingPathComponent("skills.plist")
            try plistData.write(to: plistPath)
            print("Skills data successfully saved to \(plistPath)")
        } catch {
            print("Error encoding skills data to plist: \(error)")
        }
    }
}
