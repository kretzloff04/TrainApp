//
//  StopsData.swift
//  CTA App
//
//  Created by student on 11/6/24.
//

import Foundation

struct StopsData{
    static let listOfRed: [String: (latitude: Double, longitude: Double)] = [
        "Howard": (42.01883, -87.67255),
        "Jarvis": (42.01591, -87.66914),
        "Morse": (42.00828, -87.66596),
        "Loyola": (42.00118, -87.66109),
        "Granville": (41.99382, -87.65916),
        "Throndale": (41.99009, -87.65904),
        "Bryn Mawr": (41.98367, -87.65885),
        "Berwyn": (41.97817, -87.65871),
        "Argyle": (41.94332, -87.65858),
        "Lawrence": (41.96903, -87.65845),
        "Wilson": (41.96516, -87.65794),
        "Sheridan": (41.95389, -87.65496),
        "Addison": (41.94727, -87.65362),
        "Belmont": (41.93989, -87.65329),
        "Fullerton": (41.92530, -87.65288),
        "North/Clybourn": (41.91073, -87.64899),
        "Clark/Division": (41.90390, -87.63164),
        "Chicago": (41.89670, -87.62794),
        "Grand": (41.89170, -87.62805),
        "Lake": (41.88510, -87.62788),
        "Monroe": (41.88073, -87.62769),
        "Jackson": (41.87819, -87.62764),
        "Harrison": (41.87411, -87.62773),
        "Roosevelt": (41.86748, -87.62665),
        "Cermak-Chinatown": (41.85287, -87.63091),
        "Sox-35th": (41.83097, -87.63067),
        "47th": (41.80913, -87.63165),
        "Garfield": (41.79436, -87.63116),
        "63rd": (41.78084, -87.63100),
        "69th": (41.76904, -87.62582),
        "79th": (41.75060, -87.62517),
        "87th": (41.73607, -87.62477),
        "95th/Dan Ryan" : (41.72145, -87.62437)
    ]
    
  
    
    static let listOfBrown: [String: (latitude: Double, longitude: Double)] = [
        "Kimball": (41.96773, -87.71297),
        "Kedzie": (41.96608, -87.71044),
        "Francisco": (41.96615, -87.70143),
        "Rockwell": (41.96622, -87.69393),
        "Western": (41.96632, -87.68833),
        "Damen": (41.96644, -87.67866),
        "Montrose": (41.96152, -87.67511),
        "Irving Park": (41.95423, -87.67492),
        "Addison": (41.94692, -87.67472),
        "Paulina": (41.94372, -87.67121),
        "Southport": (41.94382, -87.66352),
        "Belmont": (41.93989, -87.65329),
        "Wellington": (41.93628, -87.65332),
        "Diversey": (41.93266, -87.65320),
        "Fullerton": (41.92530, -87.65288),
        "Armitage": (41.91814, -87.65268),
        "Sedgwick": (41.91042, -87.63854),
        "Chicago": (41.89612, -87.63569),
        "Merchandise Mart": (41.88892, -87.63403),
        "Washington/Wells": (41.88261, -87.63387),
        "Quincy": (41.87876, -87.63376),
        "LaSalle/Van Buren": (41.87687, -87.63171),
        "Harold Washington Library-State/Van Buren": (41.87688, -87.62874),
        "Adams/Wabash": (41.87954, -87.62610),
        "Washington/Wabash": (41.88281, -87.62617),
        "State/Lake": (41.88576, -87.62790),
        "Clark/Lake": (41.88574, -87.63146)
    ]
    
    static let listOfPurple: [String: (latitude: Double, longitude: Double)] = [
        "Linden": (42.07282, -87.69062),
        "Central": (42.06382, -87.68563),
        "Noyes": (42.05827, -87.68347),
        "Foster": (42.05433, -87.68368),
        "Davis": (42.04788, -87.68369),
        "Dempster": (42.04164, -87.68174),
        "Main": (42.03340, -87.67990),
        "South Boulevard": (42.02752, -87.67844),
        "Howard": (42.01883, -87.67255),
        "Wilson": (41.96516, -87.65794),
        "Belmont": (41.93989, -87.65329),
        "Wellington": (41.93628, -87.65332),
        "Diversey": (41.93266, -87.65320),
        "Fullerton": (41.92530, -87.65288),
        "Armitage": (41.91814, -87.65268),
        "Sedgwick": (41.91042, -87.63854),
        "Chicago": (41.89612, -87.63569),
        "Merchandise Mart": (41.88892, -87.63403),
        "Clark/Lake": (41.88574, -87.63146),
        "State/Lake": (41.88576, -87.62790),
        "Washington/Wabash": (41.88281, -87.62617),
        "Adams/Wabash": (41.87954, -87.62610),
        "Harold Washington Library": (41.87688, -87.62874),
        "LaSalle/Van Buren": (41.87687, -87.63171),
        "Quincy": (41.87876, -87.63376),
        "Washington/Wells": (41.88261, -87.63387)
    ]
    
    static let listOfYellow: [String: (latitude: Double, longitude: Double)] = [
        "Howard": (42.01883, -87.67255),
        "Oakton-Skokie": (42.02694, -87.74749),
        "Dempster-Skokie": (42.03938, -87.75217)
    ]
    
    static let listOfOrange: [String: (latitude: Double, longitude: Double)] = [
        "Midway": (41.78674, -87.73799),
        "Pulaski": (41.79985, -87.72450),
        "Kedzie": (41.80434, -87.70436),
        "Western": (41.80469, -87.68425),
        "35th/Archer": (41.82940,-87.68078),
        "Ashland": (41.83938, -87.66522),
        "Halsted": (41.84682, -87.64806),
        "Roosevelt": (41.86748, -87.62665),
        "Harold Washington Library": (41.87688, -87.62874),
        "LaSalle/Van Buren": (41.87687, -87.63171),
        "Quincy": (41.87876, -87.63376),
        "Washington/Wells": (41.88261, -87.63387),
        "Clark/Lake": (41.88574, -87.63146),
        "State/Lake": (41.88576, -87.62790),
        "Washington/Wabash": (41.88281, -87.62617),
        "Adams/Wabash": (41.87954, -87.62610)
    ]
    
    static let listOfGreen: [String: (latitude: Double, longitude: Double)] = [
        "Harlem/Lake": (41.88697, -87.80398),
        "Oak Park": (41.88708, -87.79388),
        "Ridgeland": (41.88723, -87.78369),
        "Austin": (41.88732, -87.77422),
        "Central": (41.88744, -87.76578),
        "Laramie": (41.88720, -87.75488),
        "Cicero": (41.88657, -87.74462),
        "Pulaski": (41.88557, -87.72685),
        "Conservatory": (41.88500, -87.71684),
        "Kedzie": (41.88437, -87.70625),
        "California": (41.88428, -87.69639),
        "Ashland": (41.88535, -87.66697),
        "Morgan": (41.88562, -87.65178),
        "Clinton": (41.88575, -87.64179),
        "Clark/Lake": (41.88574, -87.63146),
        "State/Lake": (41.88576, -87.62790),
        "Washington/Wabash": (41.88281, -87.62617),
        "Adams/Wabash": (41.87954, -87.62610),
        "Roosevelt": (41.86748, -87.62665),
        "Cermak-McCormick": (41.85275, -87.62643),
        "35th-Bronzeville-IIT": (41.83199, -87.62588),
        "Indiana": (41.82186, -87.62155),
        "43rd": (41.81661, -87.61907),
        "47th": (41.80935, -87.61886),
        "51st": (41.80220, -87.61853),
        "Garfield": (41.79544, -87.61837),
        "Halsted": (41.77906, -87.64396),
        "Ashland/63rd": (41.77896, -87.66406),
        "King Drive": (41.78022, -87.61563),
        "Cottage Grove": (41.78043, -87.60596)
    ]
    
    static let listOfPink: [String: (latitude: Double, longitude: Double)] = [
        "54th/Cermak": (41.85179, -87.75656),
        "Cicero": (41.85194, -87.74559),
        "Kostner": (41.85376, -87.73325),
        "Pulaski": (41.85389, -87.72373),
        "Central Park": (41.85403, -87.71511),
        "Kedzie": (41.85417, -87.70529),
        "California": (41.85431, -87.69465),
        "Western": (41.85442, -87.68467),
        "Damen": (41.85453, -87.67614),
        "18th": (41.85797, -87.66919),
        "Polk": (41.87160, -87.66958),
        "Ashland": (41.88535, -87.66697),
        "Morgan": (41.88562, -87.65178),
        "Clinton": (41.88575, -87.64179),
        "Clark/Lake": (41.88574, -87.63146),
        "State/Lake": (41.88576, -87.62790),
        "Washington/Wabash": (41.88281, -87.62617),
        "Adams/Wabash": (41.87954, -87.62610),
        "Harold Washington Library": (41.87688, -87.62874),
        "LaSalle/Van Buren": (41.87687, -87.63171),
        "Quincy": (41.87876, -87.63376),
        "Washington/Wells": (41.88261, -87.63387)
    ]
    
    
    static let listOfBlue: [String: (latitude: Double, longitude: Double)] = [
        "O'Hare": (41.97743, -87.90412),
        "Rosemont": (41.98357, -87.85944),
        "Cumberland": (41.98432, -87.83782),
        "Harlem": (41.98235, -87.80757),
        "Jefferson Park": (41.97068, -87.76098),
        "Montrose": (41.96100, -87.74302),
        "Irving Park": (41.95295, -87.72918),
        "Addison": (41.94667, -87.71848),
        "Belmont": (41.93914, -87.71248),
        "Logan Square": (41.92972, -87.70780),
        "California": (41.92212, -87.69707),
        "Western": (41.91604, -87.68709),
        "Damen": (41.90998, -87.67783),
        "Division": (41.90353, -87.66732),
        "Chicago": (41.89624, -87.65538),
        "Grand": (41.89121, -87.64762),
        "Clark/Lake": (41.88574, -87.63146),
        "Washington": (41.88372, -87.62946),
        "Monroe": (41.88010, -87.62934),
        "Jackson": (41.87819, -87.62928),
        "LaSalle": (41.87563, -87.63124),
        "Clinton": (41.87555, -87.64099),
        "UIC-Halsted": (41.87552, -87.64986),
        "Racine": (41.87591, -87.65738),
        "Illinois Medical District": (41.87564, -87.67624),
        "Western ": (41.87558, -87.68627),
        "Kedzie-Homan": (41.87410, -87.71066),
        "Pulaski": (41.87390, -87.72560),
        "Cicero": (41.87163, -87.74493),
        "Austin": (41.87077, -87.77439),
        "Oak Park": (41.87210, -87.79165),
        "Harlem ": (41.98235, -87.80751),
        "Forest Park": (41.87424, -87.81640)
    ]
}




