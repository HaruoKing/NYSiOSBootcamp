//
//  WeaponViewModel.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/30/24.
//

import Foundation
import Combine

class WeaponsViewModel: ObservableObject {
    @Published var weapons: [Weapon] = []
    @Published var searchQuery: String = ""
    
    private var allWeapons: [Weapon] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadWeaponsFromDocumentsDirectory()
        setupSearch()
    }
    
    func loadWeaponsFromDocumentsDirectory() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("weapons.plist")
        
        if FileManager.default.fileExists(atPath: plistPath.path) {
            if let data = try? Data(contentsOf: plistPath) {
                let decoder = PropertyListDecoder()
                do {
                    let decodedWeapons = try decoder.decode([Weapon].self, from: data)
                    self.allWeapons = decodedWeapons
                    self.weapons = decodedWeapons
                    print("Data successfully loaded from plist.")
                } catch {
                    print("Error decoding plist data: \(error)")
                }
            } else {
                print("No data found at \(plistPath).")
            }
        } else {
            print("No plist file found at \(plistPath).")
        }
    }
    
    private func setupSearch() {
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else { return }
                if query.isEmpty {
                    self.weapons = self.allWeapons
                } else {
                    self.weapons = self.allWeapons.filter { weapon in
                        weapon.name.lowercased().contains(query.lowercased()) ||
                        weapon.type.lowercased().contains(query.lowercased())
                    }
                }
            }
            .store(in: &cancellables)
    }
}
