//
//  RouteModel.swift
//  CTA-App
//
//  Created by 11 GO Participant on 11/13/24.
//

import Foundation
import CoreLocation
import UIKit

struct RouteModel {
    let Name: String
    let color: UIColor
    let coordinates: [CLLocationCoordinate2D]
    
    static func allRoutes() -> [RouteModel] {
        return [
            redLineRoute,
            blueLineRoute,
            brownLineRoute,
            greenLineRoute,
            orangeLineRoute,
            pinkLineRoute,
            purpleLineRoute,
            yellowLineRoute
        ]
    }
}

let redLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 42.0191, longitude: -87.6720), // howard
    CLLocationCoordinate2D(latitude: 42.0158, longitude: -87.6690),
    CLLocationCoordinate2D(latitude: 42.0084, longitude: -87.6659),
    CLLocationCoordinate2D(latitude: 42.0014, longitude: -87.6613),
    CLLocationCoordinate2D(latitude: 41.9947, longitude: -87.6594),
    CLLocationCoordinate2D(latitude: 41.9903, longitude: -87.6590),
    CLLocationCoordinate2D(latitude: 41.9838, longitude: -87.6581),
    CLLocationCoordinate2D(latitude: 41.9733, longitude: -87.6582),
    CLLocationCoordinate2D(latitude: 41.9650, longitude: -87.6576),
    CLLocationCoordinate2D(latitude: 41.9543, longitude: -87.6545),
    CLLocationCoordinate2D(latitude: 41.9258, longitude: -87.6524),
    CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // downtown chicago
    CLLocationCoordinate2D(latitude: 41.8673, longitude: -87.6260),
    CLLocationCoordinate2D(latitude: 41.8312, longitude: -87.6309),
    CLLocationCoordinate2D(latitude: 41.8106, longitude: -87.6315),
    CLLocationCoordinate2D(latitude: 41.7941, longitude: -87.6315),
    CLLocationCoordinate2D(latitude: 41.7224, longitude: -87.6240)  // 95th/Dan Ryan
]

let redLineRoute = RouteModel(Name: "Red Line", color: .red, coordinates: redLineCoordinates)


let blueLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 41.9773, longitude: -87.9080), // O'Hare
    CLLocationCoordinate2D(latitude: 41.9701, longitude: -87.8500),
    CLLocationCoordinate2D(latitude: 41.9655, longitude: -87.8089),
    CLLocationCoordinate2D(latitude: 41.9472, longitude: -87.7501),
    CLLocationCoordinate2D(latitude: 41.9393, longitude: -87.7312),
    CLLocationCoordinate2D(latitude: 41.9337, longitude: -87.7105),
    CLLocationCoordinate2D(latitude: 41.9202, longitude: -87.6889),
    CLLocationCoordinate2D(latitude: 41.8916, longitude: -87.6368), // near downtown chicago
    CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // central loop
    CLLocationCoordinate2D(latitude: 41.8756, longitude: -87.6399),
    CLLocationCoordinate2D(latitude: 41.8740, longitude: -87.6612),
    CLLocationCoordinate2D(latitude: 41.8708, longitude: -87.6766),
    CLLocationCoordinate2D(latitude: 41.8741, longitude: -87.6904),
    CLLocationCoordinate2D(latitude: 41.8748, longitude: -87.7081),
    CLLocationCoordinate2D(latitude: 41.8703, longitude: -87.7176),
    CLLocationCoordinate2D(latitude: 41.8642, longitude: -87.7274),
    CLLocationCoordinate2D(latitude: 41.8583, longitude: -87.7456),
    CLLocationCoordinate2D(latitude: 41.8537, longitude: -87.7632),
    CLLocationCoordinate2D(latitude: 41.8485, longitude: -87.7768),
    CLLocationCoordinate2D(latitude: 41.8542, longitude: -87.7933),
    CLLocationCoordinate2D(latitude: 41.8545, longitude: -87.8004), // forest park terminal)
]

let blueLineRoute = RouteModel(Name: "Blue Line", color: .blue, coordinates: blueLineCoordinates)


let brownLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 41.9693, longitude: -87.7341), // kimball
    CLLocationCoordinate2D(latitude: 41.9630, longitude: -87.7300),
    CLLocationCoordinate2D(latitude: 41.9549, longitude: -87.7225),
    CLLocationCoordinate2D(latitude: 41.9465, longitude: -87.7102),
    CLLocationCoordinate2D(latitude: 41.9397, longitude: -87.6997),
    CLLocationCoordinate2D(latitude: 41.9311, longitude: -87.6922),
    CLLocationCoordinate2D(latitude: 41.9205, longitude: -87.6755), // near Lincoln Park
    CLLocationCoordinate2D(latitude: 41.9025, longitude: -87.6353), // near DePaul University
    CLLocationCoordinate2D(latitude: 41.8956, longitude: -87.6249), // in the Loop area
    CLLocationCoordinate2D(latitude: 41.8881, longitude: -87.6243),
    CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // central loop
    CLLocationCoordinate2D(latitude: 41.8696, longitude: -87.6357), // between clark and LaSalle
    CLLocationCoordinate2D(latitude: 41.8602, longitude: -87.6402),
    CLLocationCoordinate2D(latitude: 41.8503, longitude: -87.6507), // end of the loop section
    CLLocationCoordinate2D(latitude: 41.8431, longitude: -87.6567), // right before the last stations
    CLLocationCoordinate2D(latitude: 41.8350, longitude: -87.6693) // near the last station before departure (ravenswood)
]
                                
let brownLineRoute = RouteModel(Name: "Brown Line", color: .brown, coordinates: brownLineCoordinates)

let greenLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 41.8874, longitude: -87.6377), // ashland/63rd
    CLLocationCoordinate2D(latitude: 41.8763, longitude: -87.6349),
    CLLocationCoordinate2D(latitude: 41.8631, longitude: -87.6331),
    CLLocationCoordinate2D(latitude: 41.8547, longitude: -87.6259),
    CLLocationCoordinate2D(latitude: 41.8445, longitude: -87.6248),
    CLLocationCoordinate2D(latitude: 41.8360, longitude: -87.6255), // near the garfield park area
    CLLocationCoordinate2D(latitude: 41.8287, longitude: -87.6256),
    CLLocationCoordinate2D(latitude: 41.8152, longitude: -87.6263),
    CLLocationCoordinate2D(latitude: 41.8019, longitude: -87.6275), // near 18th street
    CLLocationCoordinate2D(latitude: 41.7927, longitude: -87.6279),
    CLLocationCoordinate2D(latitude: 41.7799, longitude: -87.6285), // near union station
    CLLocationCoordinate2D(latitude: 41.7735, longitude: -87.6300),
    CLLocationCoordinate2D(latitude: 41.7652, longitude: -87.6303),
    CLLocationCoordinate2D(latitude: 41.7595, longitude: -87.6320), // crossing the loop
    CLLocationCoordinate2D(latitude: 41.7498, longitude: -87.6354),
    CLLocationCoordinate2D(latitude: 41.7431, longitude: -87.6387),
    CLLocationCoordinate2D(latitude: 41.7392, longitude: -87.6406),
    CLLocationCoordinate2D(latitude: 41.7344, longitude: -87.6447),
    CLLocationCoordinate2D(latitude: 41.7232, longitude: -87.6464),
    CLLocationCoordinate2D(latitude: 41.7126, longitude: -87.6501), // aak park terminal
]

let greenLineRoute = RouteModel(Name: "Green Line", color: .green, coordinates: greenLineCoordinates)

let orangeLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 41.7868, longitude: -87.7525), // Midway
    CLLocationCoordinate2D(latitude: 41.7834, longitude: -87.7450),
    CLLocationCoordinate2D(latitude: 41.7773, longitude: -87.7312),
    CLLocationCoordinate2D(latitude: 41.7705, longitude: -87.7204),
    CLLocationCoordinate2D(latitude: 41.7623, longitude: -87.7097),
    CLLocationCoordinate2D(latitude: 41.7517, longitude: -87.6964),
    CLLocationCoordinate2D(latitude: 41.7424, longitude: -87.6887),
    CLLocationCoordinate2D(latitude: 41.7343, longitude: -87.6820), // near the pilsen area
    CLLocationCoordinate2D(latitude: 41.7278, longitude: -87.6748),
    CLLocationCoordinate2D(latitude: 41.7188, longitude: -87.6695),
    CLLocationCoordinate2D(latitude: 41.7109, longitude: -87.6632), // near roosevelt area
    CLLocationCoordinate2D(latitude: 41.7037, longitude: -87.6526),
    CLLocationCoordinate2D(latitude: 41.6980, longitude: -87.6462),
    CLLocationCoordinate2D(latitude: 41.6931, longitude: -87.6401),
    CLLocationCoordinate2D(latitude: 41.6857, longitude: -87.6299), // downtown Chicago
    CLLocationCoordinate2D(latitude: 41.6823, longitude: -87.6254),
    CLLocationCoordinate2D(latitude: 41.6777, longitude: -87.6227),
    CLLocationCoordinate2D(latitude: 41.6750, longitude: -87.6203),
    CLLocationCoordinate2D(latitude: 41.6735, longitude: -87.6181),
    CLLocationCoordinate2D(latitude: 41.6709, longitude: -87.6166)  // terminal in the loop
]

let orangeLineRoute = RouteModel(Name: "Orange Lines", color: .orange, coordinates: orangeLineCoordinates)

let pinkLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 41.8511, longitude: -87.7603), // 54th cermak
    CLLocationCoordinate2D(latitude: 41.8523, longitude: -87.7466),
    CLLocationCoordinate2D(latitude: 41.8548, longitude: -87.7386),
    CLLocationCoordinate2D(latitude: 41.8559, longitude: -87.7287),
    CLLocationCoordinate2D(latitude: 41.8569, longitude: -87.7192),
    CLLocationCoordinate2D(latitude: 41.8564, longitude: -87.7086),
    CLLocationCoordinate2D(latitude: 41.8541, longitude: -87.7014),
    CLLocationCoordinate2D(latitude: 41.8492, longitude: -87.6928),
    CLLocationCoordinate2D(latitude: 41.8443, longitude: -87.6872),
    CLLocationCoordinate2D(latitude: 41.8415, longitude: -87.6773), // near illinois medical district
    CLLocationCoordinate2D(latitude: 41.8341, longitude: -87.6645),
    CLLocationCoordinate2D(latitude: 41.8290, longitude: -87.6558),
    CLLocationCoordinate2D(latitude: 41.8224, longitude: -87.6497),
    CLLocationCoordinate2D(latitude: 41.8175, longitude: -87.6438),
    CLLocationCoordinate2D(latitude: 41.8144, longitude: -87.6389),
    CLLocationCoordinate2D(latitude: 41.8105, longitude: -87.6343),
    CLLocationCoordinate2D(latitude: 41.8065, longitude: -87.6290),
    CLLocationCoordinate2D(latitude: 41.8035, longitude: -87.6247), // enters the loop area
    CLLocationCoordinate2D(latitude: 41.8003, longitude: -87.6206),
    CLLocationCoordinate2D(latitude: 41.7963, longitude: -87.6164)  // loop terminal
]

let pinkLineRoute = RouteModel(Name: "Pink Line", color: .customPink, coordinates: pinkLineCoordinates)

let purpleLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 42.0734, longitude: -87.6909), // linden (wilmette)
    CLLocationCoordinate2D(latitude: 42.0649, longitude: -87.6874),
    CLLocationCoordinate2D(latitude: 42.0583, longitude: -87.6827),
    CLLocationCoordinate2D(latitude: 42.0484, longitude: -87.6782),
    CLLocationCoordinate2D(latitude: 42.0412, longitude: -87.6735),
    CLLocationCoordinate2D(latitude: 42.0361, longitude: -87.6782), // central (evanston)
    CLLocationCoordinate2D(latitude: 42.0324, longitude: -87.6795),
    CLLocationCoordinate2D(latitude: 42.0276, longitude: -87.6804),
    CLLocationCoordinate2D(latitude: 42.0228, longitude: -87.6823),
    CLLocationCoordinate2D(latitude: 42.0187, longitude: -87.6835),
    CLLocationCoordinate2D(latitude: 42.0153, longitude: -87.6851), // davis (evanston)
    CLLocationCoordinate2D(latitude: 42.0418, longitude: -87.6825),
    CLLocationCoordinate2D(latitude: 41.9980, longitude: -87.6813),
    CLLocationCoordinate2D(latitude: 41.9759, longitude: -87.6680),
    CLLocationCoordinate2D(latitude: 41.9663, longitude: -87.6677),
    CLLocationCoordinate2D(latitude: 41.9474, longitude: -87.6575), // belmont area
    CLLocationCoordinate2D(latitude: 41.9293, longitude: -87.6528),
    CLLocationCoordinate2D(latitude: 41.9245, longitude: -87.6538),
    CLLocationCoordinate2D(latitude: 41.9175, longitude: -87.6538),
    CLLocationCoordinate2D(latitude: 41.8892, longitude: -87.6373), // enters the loop
    CLLocationCoordinate2D(latitude: 41.8835, longitude: -87.6320),
    CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298) // terminal in the loop
]
let purpleLineRoute = RouteModel(Name: "Purple Line", color: .purple, coordinates: purpleLineCoordinates)

let yellowLineCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 42.0334, longitude: -87.7473), // dempster-skokie (Skokie)
    CLLocationCoordinate2D(latitude: 42.0207, longitude: -87.7335),
    CLLocationCoordinate2D(latitude: 42.0140, longitude: -87.7202),
    CLLocationCoordinate2D(latitude: 42.0088, longitude: -87.7026),
    CLLocationCoordinate2D(latitude: 42.0053, longitude: -87.6941), // passes through mccormick Blvd
    CLLocationCoordinate2D(latitude: 42.0041, longitude: -87.6835),
    CLLocationCoordinate2D(latitude: 42.0027, longitude: -87.6734),
    CLLocationCoordinate2D(latitude: 42.0014, longitude: -87.6677),
    CLLocationCoordinate2D(latitude: 41.9992, longitude: -87.6616),
    CLLocationCoordinate2D(latitude: 41.9979, longitude: -87.6567),
    CLLocationCoordinate2D(latitude: 41.9971, longitude: -87.6521), // near howard (chicago terminal)
    CLLocationCoordinate2D(latitude: 41.9954, longitude: -87.6514) // howard Station
]
let yellowLineRoute = RouteModel(Name: "Yellow Line", color: .yellow, coordinates: yellowLineCoordinates)

