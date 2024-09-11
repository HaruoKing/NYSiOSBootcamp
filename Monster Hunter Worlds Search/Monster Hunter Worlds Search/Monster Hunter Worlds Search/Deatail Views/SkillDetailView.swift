//
//  SkillsView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import SwiftUI

struct SkillDetailView: View {
    let skill: Skill
    
    var body: some View {
        ZStack {
            AppColors.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(skill.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Text(skill.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Ranks")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        if skill.ranks.isEmpty {
                            Text("No ranks available")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                        } else {
                            ForEach(skill.ranks, id: \.level) { rank in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Level \(rank.level)")
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                    Text(rank.description)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                    
                                    if let modifiers = rank.skillModifiers {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Modifiers")
                                                .font(.headline)
                                                .foregroundColor(AppColors.primary)
                                                .padding(.bottom, 4)
                                            
                                            if let affinity = modifiers.affinity {
                                                Text("Affinity: \(affinity)%")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            } else {
                                                Text("No Affinity Modifier")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            }
                                            
                                            if let attack = modifiers.attack {
                                                Text("Attack: \(attack)")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            } else {
                                                Text("No Attack Modifier")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            }
                                            
                                            if let defense = modifiers.defense {
                                                Text("Defense: \(defense)")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            } else {
                                                Text("No Defense Modifier")
                                                    .font(.subheadline)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .shadow(radius: 2)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
            }
        }
        .navigationTitle(skill.name)
        .transition(.opacity)
    }
}
