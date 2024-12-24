//
//  LocalData.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import Foundation

struct LocalData: Identifiable, Codable {
    var id = UUID()
    var date: String
    var cityName: String
    var temperature: String
    var description: String
    var humidity: String
}
