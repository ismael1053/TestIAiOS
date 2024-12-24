//
//  MapsView.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    @EnvironmentObject var viewModel: TestIAViewModel
        
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.places) { place in
            MapPin(coordinate: place.coordinate, tint: .blue)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    MapsView()
}
 
