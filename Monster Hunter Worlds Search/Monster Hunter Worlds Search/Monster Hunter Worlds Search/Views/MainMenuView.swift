//
//  MainMenuView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Monster Hunter World")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.primary)
                    .padding(.top, 50)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack(spacing: 20) {
                    NavigationLink(destination: MonsterListView()) {
                        MenuButton(title: "Monsters", icon: "pawprint.fill")
                    }
                    
                    NavigationLink(destination: LocationListView()) {
                        MenuButton(title: "Locations", icon: "map.fill")
                    }
                    
                    NavigationLink(destination: SkillListView()) {
                        MenuButton(title: "Skills", icon: "star.fill")
                    }
                    
                    NavigationLink(destination: WeaponsListView()) {
                        MenuButton(title: "Weapons", icon: "hammer.fill")
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Text("Explore the world of Monster Hunter")
                    .font(.footnote)
                    .foregroundColor(AppColors.secondary)
                    .padding(.bottom, 40)
            }
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [AppColors.background, AppColors.primary.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}
