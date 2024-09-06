//
//  MonsterListViewModel.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import Foundation
import Combine

class MonsterListViewModel: ObservableObject {
    @Published var monsters: [Monster] = []
    @Published var searchQuery: String = ""
    
    private var allMonsters: [Monster] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadMonstersFromDocumentsDirectory()
        setupSearch()
    }
    
    func loadMonstersFromDocumentsDirectory() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("monsters.plist")
        
        if FileManager.default.fileExists(atPath: plistPath.path) {
            if let data = try? Data(contentsOf: plistPath) {
                let decoder = PropertyListDecoder()
                do {
                    let decodedMonsters = try decoder.decode([Monster].self, from: data)
                    self.allMonsters = decodedMonsters
                    self.monsters = decodedMonsters
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
                    self.monsters = self.allMonsters
                } else {
                    self.monsters = self.allMonsters.filter { monster in
                        monster.name.lowercased().contains(query.lowercased())
                    }
                }
            }
            .store(in: &cancellables)
    }
}
