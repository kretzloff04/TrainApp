////
////  MapPreviewUpdate.swift
////  CTA Safety
////
////  Created by student on 10/16/24.
////
//
//import SwiftUI
//import MapKit
//struct MapPreviewUpdate: View {
//    
//    var update: News
//    var body: some View {
//        Map(initialPosition: .region(region))
//        
//    }
//    private var region: MKCoordinateRegion {
//            MKCoordinateRegion(
//                center: CLLocationCoordinate2D(latitude: update.locationCoordinate.latitude, longitude: update.locationCoordinate.longitude),
//                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//            )
//        }
//}
//
//#Preview {
//    MapPreviewUpdate(update: Updates[0])
//}
