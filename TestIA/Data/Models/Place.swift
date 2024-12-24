//
//  Place.swift
//  TestIA
//
//  Created by Roque Sandoval Serrato on 23/12/24.
//

import Foundation
import MapKit

struct Place: Identifiable {
    var id = UUID() // Un identificador único
    var coordinate: CLLocationCoordinate2D
}
