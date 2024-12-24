//
//  ContentView.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TestIAViewModel()

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Inicio")
                        }
                    
                    MapsView()
                        .tabItem {
                            Image(systemName: "map.fill")
                            Text("Mapa")
                        }
                    OtherView()
                        .tabItem {
                            Image(systemName: "gearshape.fill")
                            Text("Otros")
                        }
                }
            }
        }
        .accentColor(.blue)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.getData()
        }
    }
}

#Preview {
    ContentView()
}
