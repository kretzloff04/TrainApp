//
//  UpdateRowView.swift
//  CTA Safety
//
//  Created by student on 10/16/24.
//

import SwiftUI
import MapKit

struct UpdateRowView: View {
    private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue Line", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)
    
    var body: some View {
        HStack{
            MapPreviewUpdate(update: mockUpdate)
                .frame(width: 75, height:75)
            
            
            
            
        }
    }
}

#Preview {
    UpdateRowView()
}
