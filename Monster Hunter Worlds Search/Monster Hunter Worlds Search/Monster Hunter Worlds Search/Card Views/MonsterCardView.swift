//
//  MonsterCardView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

struct MonsterCardView: View {
    let monster: Monster
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(monster.name)
                    .font(.headline)
                    .foregroundColor(AppColors.primary)
                Text(monster.species)
                    .font(.subheadline)
                    .foregroundColor(AppColors.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: "pawprint.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(AppColors.primary)
                .background(AppColors.background)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: AppColors.primary.opacity(0.1), radius: 6, x: 0, y: 4)
    }
}
