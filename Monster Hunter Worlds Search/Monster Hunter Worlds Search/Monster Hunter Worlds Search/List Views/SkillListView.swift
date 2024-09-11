//
//  SkillsListView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import SwiftUI

struct SkillListView: View {
    @StateObject private var viewModel = SkillViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search Skills...", text: $viewModel.searchQuery)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color(Color.white))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.skills) { skill in
                            NavigationLink(destination: SkillDetailView(skill: skill)) {
                                SkillCardView(skill: skill)
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
            .navigationTitle("Skills")
            .background(AppColors.background.edgesIgnoringSafeArea(.all))
        }
    }
}
