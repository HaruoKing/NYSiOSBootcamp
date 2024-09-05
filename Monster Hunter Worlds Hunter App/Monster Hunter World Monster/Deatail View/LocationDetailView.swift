//
//  LocationDetailView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import SwiftUI

struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        ZStack {
            AppColors.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(location.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Text("Zones: \(location.zoneCount)")
                        .font(.title2)
                        .foregroundColor(AppColors.secondary)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Camps")
                            .font(.headline)
                            .foregroundColor(AppColors.primary)
                            .padding(.horizontal)
                        
                        if location.camps.isEmpty {
                            Text("No camps available")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        } else {
                            ForEach(location.camps, id: \.name) { camp in
                                HStack {
                                    Text(camp.name)
                                    Spacer()
                                    Text("Zone: \(camp.zone)")
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
        .navigationTitle(location.name)
        .transition(.opacity)
    }
}
