//  CTA-SAFEMA.swift
//  CTA-SafetyMAP-Advanced
//
//  Created by 11 GO Participant on 10/31/24.
//

import SwiftUI
import SwiftData
import MapKit
import Firebase

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
    @State private var selectedCategory: String = "All" // Added category state
    @State private var showReportView = false
    @State private var showReportDtails = false

    @StateObject private var locationManager = LocationManager()
    @State private var updates: [News] = []
    

    let ctaRoutes: [RouteModel] = RouteModel.allRoutes()
    
    let lineColors: [String: Color] = [
        "Red": .red,
        "Blue": .blue,
        "Green": .green,
        "Brown": .brown,
        "Orange": .orange,
        "Purple": .purple,
        "Pink": .pink,
        "Yellow": .yellow
    ]
    

    var body: some View {
        ZStack {
            Map(position: $cameraPosition, selection: $mapSelection) {
                UserAnnotation()
                
                ForEach(updates) { update in
                    let markerColor = lineColors[update.line] ?? .gray
                    
                    Marker(update.title, coordinate: CLLocationCoordinate2D(latitude: update.latitude, longitude: update.longitude))
                        .tint(markerColor)
                }
            
                
                // displaying search results ~
                ForEach(results, id: \.self) { item in
                    let placemark = item.placemark
                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                        .tint(Color.gray)
                }
                
                // displaying route polyline if route is selected ~
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(Color.blue, lineWidth: 6)
                }
            }
            .onAppear {
                locationManager.requestLocation()
                Task {
                    updates = await loadData() // Fetch updates from Firestore
                }
            }
            
            
            // emergency report button ~
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showReportView = true // trigger ~ navigation to ReportView
                    }) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $showReportView) {
                ReportView() // shows ReportView in hurry !
                            .presentationDragIndicator(.visible) // drag view ~
                            .presentationCornerRadius(20)
            }
            
            // search bar ~
            // search text field ~
            .overlay(alignment: .top) {
                TextField("Search for a location...", text: $searchText)
                    .font(.subheadline)
                    .padding(12)
                    .foregroundColor(Color.black)
                    .background(Color.white.opacity(0.1))
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                    .shadow(radius: 10)
            }
            .onSubmit(of: .text) {
                Task { await searchPlaces() }
            }
            .onChange(of: getDirections, { oldValue, newValue in
                if newValue {
                    fetchRoute()
                }
            })
        }
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails) {
            LocationDetailsView(mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(365)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(350)))
                .presentationCornerRadius(10)
        }
        .mapControls {
            MapCompass()
                //.mapControlVisibility(.visible)
                // MapPitchToggle()
            MapUserLocationButton()
                .mapStyle(MapStyle.standard)
        }
    }
}


extension F_MapView {
    // search places ~
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    // fetching routes ~
    func fetchRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: locationManager.userLocation))
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
    
    func getRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: locationManager.userLocation))
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

// Location Manager to fetch the user's current location
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D = .init(latitude: 41.881832, longitude: -87.623177)
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.first else { return }
        userLocation = newLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}

// user region definition
extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: LocationManager().userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

#Preview {
    F_MapView()
}
