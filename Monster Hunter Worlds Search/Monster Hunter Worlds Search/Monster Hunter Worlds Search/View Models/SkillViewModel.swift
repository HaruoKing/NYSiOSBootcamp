//
//  SkillsViewModel.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import Foundation
import Combine

class SkillViewModel: ObservableObject {
    @Published var skills: [Skill] = []
    @Published var searchQuery: String = ""
    
    private var allSkills: [Skill] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadSkillsFromDocumentsDirectory()
        setupSearch()
    }
    
    func loadSkillsFromDocumentsDirectory() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("skills.plist")
        
        if FileManager.default.fileExists(atPath: plistPath.path) {
            if let data = try? Data(contentsOf: plistPath) {
                let decoder = PropertyListDecoder()
                do {
                    let decodedSkills = try decoder.decode([Skill].self, from: data)
                    self.allSkills = decodedSkills
                    self.skills = decodedSkills
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
                    self.skills = self.allSkills
                } else {
                    self.skills = self.allSkills.filter { skill in
                        skill.name.lowercased().contains(query.lowercased())
                    }
                }
            }
            .store(in: &cancellables)
    }
}
