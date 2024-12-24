//
//  OtherView.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import SwiftUI

struct OtherView: View {
    @EnvironmentObject var viewModel: TestIAViewModel
    
    var body: some View {
        List(viewModel.localData) { data in
            VStack(alignment: .leading) {
                Text(data.date)
                    .font(.headline)
                Text(viewModel.description)
                    .font(.headline)
                Text(viewModel.humidity)
                    .font(.headline)
                    .foregroundColor(.gray)
                HStack {
                    Text(viewModel.temperature)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Spacer()
                    Text(data.cityName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 4)
            }
            .padding()
        }
    }
}

#Preview {
    OtherView()
}
