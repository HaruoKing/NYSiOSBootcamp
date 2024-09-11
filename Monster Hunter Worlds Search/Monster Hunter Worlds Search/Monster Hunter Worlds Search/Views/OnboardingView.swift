//
//  Onboarding.swift
//  Monster Hunter World Monster Search
//
//  Created by Victor Rodriguez on 8/26/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var navigateToMainView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("MHW App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("This app provides detailed information about monsters, skills, weapons, and locations in Monster Hunter World. Please wait while we download the latest data.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                if viewModel.isLoading {
                    ProgressView("Downloading data...")
                }
                
                Button(action: {
                    if !viewModel.isLoading {
                        hasCompletedOnboarding = true
                        navigateToMainView = true
                    }
                }) {
                    Text("Continue")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isLoading ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.isLoading)
                .padding()
            }
            .padding()
            .onAppear {
                viewModel.fetchDataFromAPI()
            }
            .navigationDestination(isPresented: $navigateToMainView) {
                MonsterListView()
            }
        }
    }
}
