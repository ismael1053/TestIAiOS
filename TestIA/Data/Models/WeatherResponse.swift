//
//  WeatherResponse.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

// MARK: - Coord
struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int

    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}

// MARK: - Sys
struct Sys: Decodable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

// MARK: - JSON Decoding

// Ejemplo de cómo decodificar la respuesta JSON:
func decodeWeatherResponse(from data: Data) -> WeatherResponse? {
    let decoder = JSONDecoder()
    do {
        let response = try decoder.decode(WeatherResponse.self, from: data)
        return response
    } catch {
        print("Error decoding data: \(error)")
        return nil
    }
}
