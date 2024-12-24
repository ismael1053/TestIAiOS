//
//  TestIAViewModel.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import Foundation
import Combine
import MapKit

class TestIAViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    @Published var temperature: String = ""
    @Published var description: String = ""
    @Published var humidity: String = ""
    @Published var cityName: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var region: MKCoordinateRegion
    @Published var places: [Place] = []
    @Published var localData: [LocalData] = []
    
    init() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // San Francisco
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        loadData()
    }
    
    func updateCoordinates(latitude: Double, longitude: Double) {
        region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func getData() {
        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/landon/EN") else {
            errorMessage = "URL inválida."
            return
        }
        
        let headers = [
            "x-rapidapi-key": "0d6e90a3f5msh8bfdc8f1030b7b6p17cec3jsnc4eff5334ec2",
            "x-rapidapi-host": "open-weather13.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = headers
        
        isLoading = true
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = "Error: \(error.localizedDescription)"
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { weatherResponse in
                self.cityName = weatherResponse.name
                self.temperature = String(format: "%.1f°F", weatherResponse.main.temp)
                self.description = weatherResponse.weather.first?.description ?? "N/A"
                self.humidity = "Humidity: \(Int(weatherResponse.main.humidity))%"
                
                self.addLocalData(weatherResponse)
                self.updateCoordinates(latitude: weatherResponse.coord.lat, longitude: weatherResponse.coord.lon)
                self.places.append(Place(coordinate: CLLocationCoordinate2D(latitude: weatherResponse.coord.lat, longitude: weatherResponse.coord.lon)))
            })
            .store(in: &cancellables)
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(localData) {
            UserDefaults.standard.set(encoded, forKey: "localDataList")
        }
    }
    
    // Cargar lista de usuarios desde UserDefaults
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "localDataList") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([LocalData].self, from: savedData) {
                localData = loadedData
            }
        }
    }
    
    func addLocalData(_ weatherResponse: WeatherResponse) {
        let newLocalData = LocalData(
            date: getDate(),
            cityName: weatherResponse.name,
            temperature: String(format: "%.1f°F", weatherResponse.main.temp),
            description: weatherResponse.weather.first?.description ?? "N/A",
            humidity: "Humidity: \(Int(weatherResponse.main.humidity))%"
        )
        localData.append(newLocalData)
        saveData()
    }
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
