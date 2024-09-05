//
//  Monster_Hunter_World_MonsterApp.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

@main
struct Monster_Hunter_World_MonsterApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

     var body: some Scene {
         WindowGroup {
             if hasCompletedOnboarding {
                 MainMenuView() // Show the main view directly if onboarding is completed
             } else {
                 SplashScreenView() // Start with the splash screen if onboarding is not completed
             }
         }
     }
 }
