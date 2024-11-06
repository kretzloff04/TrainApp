//
//  UpdatesPage.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct News: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var line: String
    var station: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

