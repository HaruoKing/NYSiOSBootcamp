//
//  Monster_Hunter_Worlds_SearchApp.swift
//  Monster Hunter Worlds Search
//
//  Created by Victor Rodriguez on 9/6/24.
//

import SwiftUI

@main
struct Monster_Hunter_Worlds_SearchApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

     var body: some Scene {
         WindowGroup {
             if hasCompletedOnboarding {
                 MainMenuView()
             } else {
                 SplashScreenView() 
             }
         }
     }
 }
