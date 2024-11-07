//
//  UpdateStruct.swift
//  CTA Safety
//
//  Created by student on 10/16/24.
//

import Foundation
import SwiftUI
import CoreLocation


struct Update{
    var title: String
    var urgency: Int //on a scale of 1-5(1: not urgent (someone smoking), 5: avoid at all cost (violence))
    var description: String //maybe a user's description of what happened
    var selection: Int //a user's premade selection(smoking, physical alteraction etc.)
    
    var coordinates: Coordinates // "Coordinates" type is initalized in the struct on line 28
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
        
    }
    
    
    
}

var granvilleUpdate:Update = Update(title: "Assault at Granville", urgency: 4, description:"man assaults another man at granville redline", selection: 3, coordinates: Update.Coordinates(latitude: 41.99386980210153, longitude: -87.65915229830303))

var listOfUpdates: [Update] = [granvilleUpdate]
