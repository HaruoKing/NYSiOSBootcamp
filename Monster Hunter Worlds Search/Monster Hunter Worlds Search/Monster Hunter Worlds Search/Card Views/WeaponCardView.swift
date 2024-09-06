//
//  WeaponCardView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import SwiftUI

struct WeaponsCardView: View {
    let weapon: Weapon
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(weapon.name)
                    .font(.headline)
                    .foregroundColor(AppColors.primary)
                Text("Type: \(weapon.type)")
                    .font(.subheadline)
                    .foregroundColor(AppColors.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: "hammer.fill")
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
