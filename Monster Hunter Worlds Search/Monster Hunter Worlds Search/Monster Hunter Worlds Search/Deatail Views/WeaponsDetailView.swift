//
//  WeaponsDetailView.swift
//  Monster Hunter World Search
//
//  Created by Victor Rodriguez on 8/30/24.
//

import SwiftUI

struct WeaponsDetailView: View {
    let weapon: Weapon
    
    var body: some View {
        ZStack {
            AppColors.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(weapon.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Text("Type: \(weapon.type)")
                        .font(.title2)
                        .foregroundColor(AppColors.secondary)
                        .padding(.horizontal)
                    
                    Text("Rarity: \(weapon.rarity)")
                        .font(.title3)
                        .foregroundColor(AppColors.secondary)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Attack")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        Text("Display: \(weapon.attack.display)")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Attributes")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        if let damageType = weapon.attributes.damageType, !damageType.isEmpty {
                            HStack {
                                Text("Damage Type: \(damageType)")
                                Spacer()
                            }
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        } else {
                            Text("No Damage Type")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                        }
                        
                        if let elderseal = weapon.attributes.elderseal, !elderseal.isEmpty {
                            HStack {
                                Text("Elderseal: \(elderseal)")
                                Spacer()
                            }
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        } else {
                            Text("No Elderseal")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
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
        .navigationTitle(weapon.name)
        .transition(.opacity)
    }
}
