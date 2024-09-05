//
//  MonsterListView.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

struct MonsterListView: View {
    @StateObject private var viewModel = MonsterListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search Monsters...", text: $viewModel.searchQuery)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.monsters) { monster in
                            NavigationLink(destination: MonsterDetailView(monster: monster)) {
                                MonsterCardView(monster: monster)
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
            .navigationTitle("Monsters")
            .background(AppColors.background.edgesIgnoringSafeArea(.all))
        }
    }
}
