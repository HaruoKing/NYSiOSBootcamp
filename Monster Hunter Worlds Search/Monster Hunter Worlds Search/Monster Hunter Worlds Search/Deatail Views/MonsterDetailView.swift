//
//  MonsterDetailView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

struct MonsterDetailView: View {
    let monster: Monster
    
    var body: some View {
        ZStack {
            AppColors.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(monster.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Text(monster.species)
                        .font(.title2)
                        .foregroundColor(AppColors.secondary)
                        .padding(.horizontal)
                    
                    Text(monster.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Elements")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        if monster.elements.isEmpty {
                            Text("No elements")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        } else {
                            Text(monster.elements.joined(separator: ", "))
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Weaknesses")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        if monster.weaknesses.isEmpty {
                            Text("No weaknesses")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        } else {
                            ForEach(monster.weaknesses, id: \.element) { weakness in
                                HStack {
                                    Text(weakness.element)
                                    Spacer()
                                    Text("Stars: \(weakness.stars)")
                                }
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
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
        .navigationTitle(monster.name)
        .transition(.opacity)
    }
}
