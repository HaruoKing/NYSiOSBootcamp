//
//  DataStorageTests.swift
//  Monster Hunter Worlds Search
//
//  Created by Victor Rodriguez on 9/6/24.
//

import XCTest
@testable import Monster_Hunter_Worlds_Search

class DataStorageTests: XCTestCase {
    var viewModel: OnboardingViewModel!

    override func setUp() {
        super.setUp()
        viewModel = OnboardingViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSavingMonstersToPlist() {
        let testMonsters = [Monster(id: 1, name: "TestMonster", type: "TestType", species: "TestSpecies", description: "TestDesc", elements: [], weaknesses: [], icon: nil)]

        viewModel.saveDataToPlist(monsters: testMonsters)

        // Verify the plist file exists
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("monsters.plist")

        XCTAssertTrue(FileManager.default.fileExists(atPath: plistPath.path), "Monsters plist should exist")
    }

    func testSavingLocationsToPlist() {
        let testLocations = [Location(id: 1, name: "TestLocation", zoneCount: 5, camps: [])]

        viewModel.saveLocationsToPlist(locations: testLocations)

        // Verify the plist file exists
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let plistPath = documentDirectory.appendingPathComponent("locations.plist")

        XCTAssertTrue(FileManager.default.fileExists(atPath: plistPath.path), "Locations plist should exist")
    }
}
