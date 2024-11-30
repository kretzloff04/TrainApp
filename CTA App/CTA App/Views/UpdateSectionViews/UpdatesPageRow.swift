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
    
    private var postedTimeAgo: String{
        let format = RelativeDateTimeFormatter()
        format.unitsStyle = .abbreviated
        
        if let timePosted = updatespage.timePosted{
            return format.localizedString(for: timePosted, relativeTo: Date())
        }
        else{
            return "Unknown Time"
        }
        
    }
    
    var body: some View {
        HStack {
            ZStack{
                Color("custom\(updatespage.line)")
                    .frame(width:15, height:50)
                    .cornerRadius(5)
                if(updatespage.priorityLevel != 0){
                    Text("\(updatespage.priorityLevel)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        
                    
                }
                
            }

            
            Text(updatespage.title)
                .truncationMode(.tail)
                
                
            Spacer()
            
            Text(postedTimeAgo)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        
    }
}
private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)

#Preview{
    UpdatesPageRow(updatespage: mockUpdate)
}
