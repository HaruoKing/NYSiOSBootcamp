//
//  LocationViewModel.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import Foundation
import Combine

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var searchQuery: String = ""
    
    private var allLocations: [Location] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadLocationsFromDocumentsDirectory()
        setupSearch()
    }
    
    func loadLocationsFromDocumentsDirectory() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("locations.plist")
        
        if FileManager.default.fileExists(atPath: plistPath.path) {
            if let data = try? Data(contentsOf: plistPath) {
                let decoder = PropertyListDecoder()
                do {
                    let decodedLocations = try decoder.decode([Location].self, from: data)
                    self.allLocations = decodedLocations
                    self.locations = decodedLocations
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
                    self.locations = self.allLocations.sorted { $0.zoneCount < $1.zoneCount }
                } else {
                    self.locations = self.allLocations.filter { location in
                        location.name.lowercased().contains(query.lowercased()) ||
                        "\(location.zoneCount)".contains(query)
                    }
                    .sorted { $0.zoneCount < $1.zoneCount }
                }
            }
            .store(in: &cancellables)
    }
}
