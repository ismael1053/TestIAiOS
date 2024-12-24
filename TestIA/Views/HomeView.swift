//
//  HomeView.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: TestIAViewModel

    var body: some View {
        VStack {
            Text(viewModel.cityName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(viewModel.temperature)
                .font(.title)
                .foregroundColor(.blue)
            
            Text(viewModel.description)
                .font(.body)
                .padding()
            
            Text(viewModel.humidity)
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
