//
//  MakeReportStruct.swift
//  CTA Safety
//
//  Created by student on 10/25/24.
//

import Foundation
import SwiftUI

struct reportPage{
    
    var imageName: String
    private var image: Image{
        Image(imageName)
    }
    
    var colorName: String
    private var color: Color{
        Color(colorName)
    }
}
