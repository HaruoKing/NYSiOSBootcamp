//
//  SkillCardView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import SwiftUI

struct SkillCardView: View {
    let skill: Skill
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(skill.name)
                    .font(.headline)
                    .foregroundColor(AppColors.primary)
                Text(skill.description)
                    .font(.subheadline)
                    .foregroundColor(AppColors.secondary)
                    .lineLimit(2)
            }
            Spacer()
            Image(systemName: "star.fill") 
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(AppColors.primary)
                .background(AppColors.background)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: AppColors.primary.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
