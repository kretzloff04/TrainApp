//
//  CTA-SAFEMA.swift
//  CTA-SafetyMAP-Advanced
//
//  Created by 11 GO Participant on 10/31/24.
//

import SwiftUI
import SwiftData
import MapKit

struct F_MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
            
            UserAnnotation()
            
            ForEach(results, id: \.self) { item in
                if routeDisplaying {
                    if item == routeDestination {
                        let placemark = item.placemark
                        Marker(placemark.name ?? "", coordinate: item.placemark.coordinate)
                    }
                } else {
                    let placemark = item.placemark
                    Marker(placemark.name ?? "", coordinate: item.placemark.coordinate)
                }
            }
            
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
        
        .overlay(alignment: .top) {
            TextField("Search for a location...", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(Color.white.opacity(0.1))
                .background(.white)
                .padding()
                .shadow(radius: 10)
        }
        .onSubmit(of: .text) {
            Task { await searchPlaces()}
        }
        .onChange(of: getDirections, { oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        })
        
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
            
        })
        .sheet(isPresented: $showDetails, content: {
            LocationDetailsView(mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
            
                
        })
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}

extension F_MapView {
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                
                withAnimation(.snappy) {
                    routeDisplaying = true
                    showDetails = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                        cameraPosition = .rect(rect)
                        
                    }
                    
                }
            }
        }
    }
}


extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 41.881832, longitude: -87.623177)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

#Preview {
    F_MapView()
}
