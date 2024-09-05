//
//  LocationsView.swift
//  Monster Hunter World Monster
//
//  Created by Victor Rodriguez on 8/28/24.
//

import SwiftUI

struct LocationListView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search Locations...", text: $viewModel.searchQuery)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.locations) { location in
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                LocationCardView(location: location)
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
            .navigationTitle("Locations")
            .background(AppColors.background.edgesIgnoringSafeArea(.all))
        }
    }
}
