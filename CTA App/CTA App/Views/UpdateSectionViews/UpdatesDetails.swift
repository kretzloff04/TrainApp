//
//  SwiftUIView.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore



struct UpdatesDetails: View {
    var update: News
    let db = Firestore.firestore()
    
    private var postedTimeAgo: String{
        let format = RelativeDateTimeFormatter()
        format.unitsStyle = .abbreviated
        
        if let timePosted = update.timePosted{
            return format.localizedString(for: timePosted, relativeTo: Date())
        }
        else{
            return "Unknown Time"
        }
        
    }
    
    var body: some View {
        ScrollView {
            
            MapPreviewUpdate(update: update)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding(.horizontal)

                
            VStack(alignment: .leading, spacing: 10) {
                    // Title of the update
                    Text(update.title)
                        .font(.title)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Location information
                    Text("Station: \(update.station)" )
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    HStack {
                        Text("Line: \(update.line)" )
                        Spacer()
                        Text("Posted \(postedTimeAgo)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                    if(update.priorityLevel == 0){
                        Text("Priority Level: N/A")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    }
                    else{
                        Text("Priority Level: \(update.priorityLevel)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                    }
           
                
                
                    Divider()
                        .padding(.horizontal)
                    
                    // Description text
                    Text(update.description)
                        .font(.body)
                        .padding(.horizontal)
                        .padding(.top, 5)

                }
            
            }
        
        .navigationTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
        }
    }
private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)


#Preview {
    UpdatesDetails(update: mockUpdate)
}

