//
//  APIServiceTests.swift
//  APIServiceTests
//
//  Created by Victor Rodriguez on 9/6/24.
//

import XCTest
@testable import Monster_Hunter_Worlds_Search

class APIServiceTests: XCTestCase {
    var viewModel: OnboardingViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = OnboardingViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchMonstersAPI() async throws {
        let expectation = XCTestExpectation(description: "Download monster data from API")
        
        do {
            let monsters = try await viewModel.downloadMonstersData()
            XCTAssertFalse(monsters.isEmpty, "Monsters data should not be empty")
            expectation.fulfill()
        } catch {
            XCTFail("API call failed: \(error)")
        }
        
        await fulfillment(of: [expectation], timeout: 5.0)
    }
    
    func testFetchLocationsAPI() async throws {
        let expectation = XCTestExpectation(description: "Download location data from API")
        
        do {
            let locations = try await viewModel.downloadLocationsData()
            XCTAssertFalse(locations.isEmpty, "Locations data should not be empty")
            expectation.fulfill()
        } catch {
            XCTFail("API call failed: \(error)")
        }
        await fulfillment(of: [expectation], timeout: 5.0)
    }
}
