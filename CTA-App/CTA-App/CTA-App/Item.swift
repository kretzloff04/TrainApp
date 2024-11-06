//
//  Item.swift
//  CTA-App
//
//  Created by 11 GO Participant on 11/6/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
