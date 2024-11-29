//
//  UpdatesPageRow.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI
import Foundation

struct UpdatesPageRow: View {
    var updatespage: News
    
    var body: some View {
        HStack {
//            updatespage.image
//                .resizable()
//                .frame(width: 50, height: 50)
            Text(updatespage.title)
                
            Spacer()
        }
    }
}
private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue Line", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)

#Preview{
    UpdatesPageRow(updatespage: mockUpdate)
}
