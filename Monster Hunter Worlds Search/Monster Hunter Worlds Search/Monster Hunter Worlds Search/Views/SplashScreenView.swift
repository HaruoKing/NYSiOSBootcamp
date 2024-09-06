//
//  SplashScreenView.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var rotationAngle = 0.0
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Text("M")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotationAngle))
                .onAppear {
                    withAnimation(.linear(duration: 3).repeatCount(1, autoreverses: false)) {
                        self.rotationAngle = 360
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.isActive = true
                    }
                }
        }
        .fullScreenCover(isPresented: $isActive) {
            OnboardingView()
        }
    }
}
