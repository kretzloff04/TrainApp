//
//  CTAColor.swift
//  CTA Safety
//
//  Created by student on 10/31/24.
//

import Foundation
import SwiftUI

enum CTAColor: String {
    case red = "customRed"
    case blue = "customBlue"
    case brown = "customBrown"
    case green = "customGreen"
    case orange = "customOrange"
    case pink = "customPink"
    case purple = "customPurple"
    case yellow = "customYellow"
    
    var color: Color {
        Color(self.rawValue)
    }
}
