//
//  MapPreviewUpdate.swift
//  CTA Safety
//
//  Created by student on 10/16/24.
//
//import Foundation
//import SwiftUI
//import MapKit
//struct MapPreviewUpdate: View {
//    var update: News
//    
//    var body: some View {
//        Map(initialPosition: .region(region))
//    }
//    
//    
//    private var region: MKCoordinateRegion {
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: update.latitude, longitude: update.longitude),
//            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        )
//    }
//}
//
//private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue Line", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)
//
//#Preview {
//    MapPreviewUpdate(update: mockUpdate)
//}
import SwiftUI
import MapKit

struct MapPreviewUpdate: View {
    var update: News

    var body: some View {
        Map(initialPosition: .region(region)) {
            // Add a marker for the update's location
            Marker(update.title, coordinate: CLLocationCoordinate2D(latitude: update.latitude, longitude: update.longitude))
        }
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: update.latitude, longitude: update.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

