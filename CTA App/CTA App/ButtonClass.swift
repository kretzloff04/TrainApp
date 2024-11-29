//
//  ButtonClass.swift
//  CTA Safety
//
//  Created by student on 10/15/24.
//

import Foundation
import SwiftUICore

struct reportButton{
    var text: String
    var colorName: String
    
    private var color: Color{
        Color(colorName)
    }
    
    
}

var buttonRed: reportButton = reportButton(text: "Red Line", colorName: "customRed")
var buttonBrown: reportButton = reportButton(text: "Brown Line", colorName: "customBrown")
var buttonPurple: reportButton = reportButton(text: "Purple Line", colorName: "purple")
var buttonOrange: reportButton = reportButton(text: "Orange Line", colorName: "customOrange")
var buttonGreen: reportButton = reportButton(text: "Green Line", colorName: "customGreen")
var buttonBlue: reportButton = reportButton(text: "Blue Line", colorName: "customBlue")
var buttonPink: reportButton = reportButton(text: "Pink Line", colorName: "pink")

let reportButtons: [reportButton] = [buttonRed, buttonBrown, buttonPurple, buttonOrange, buttonGreen, buttonBlue, buttonPink]










