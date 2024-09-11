//
//  MenuButton.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 9/3/24.
//

import SwiftUI

struct MenuButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .padding(.trailing, 10)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [AppColors.primary, AppColors.primary.opacity(0.8)]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(15)
        .shadow(color: AppColors.primary.opacity(0.3), radius: 10, x: 0, y: 5)
        .scaleEffect(1.05)
        .animation(.easeInOut(duration: 0.2), value: title)
    }
}
