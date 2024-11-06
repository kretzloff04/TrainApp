//
//  MapView.swift
//  CTA Safety
//
//  Created by student on 10/15/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map()
            .ignoresSafeArea()
    }
}

#Preview {
    MapView()
}
