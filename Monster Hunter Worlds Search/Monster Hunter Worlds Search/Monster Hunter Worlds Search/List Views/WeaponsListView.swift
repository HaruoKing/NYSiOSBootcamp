//
//  WeaponsView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import SwiftUI

struct WeaponsListView: View {
    @StateObject private var viewModel = WeaponsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search Weapons...", text: $viewModel.searchQuery)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.weapons) { weapon in
                            NavigationLink(destination: WeaponsDetailView(weapon: weapon)) {
                                WeaponsCardView(weapon: weapon)
                                    .padding(.horizontal)
                                    .transition(.opacity.combined(with: .slide))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.top)
                }
                .background(AppColors.background)
            }
            .navigationTitle("Weapons")
            .background(AppColors.background.edgesIgnoringSafeArea(.all))
        }
    }
}
