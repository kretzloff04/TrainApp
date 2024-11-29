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
                    HStack {
                        Text("Station: \(update.station)" )
                        Spacer()
                        Text("Line: \(update.line)" )
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    // Description text
                    Text(update.description)
                        .font(.body)
                        .padding(.horizontal)
                        .padding(.top, 5)
                
                    Button(action: {
                        db.collection("updates").document(update.id).setData(["numReports" : update.numReports + 1])
                        if(update.numReports >= 5){
                            db.collection("updates").document(update.id).delete()
                        }
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 300, height: 50)
                            Text("Report")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customRed"))
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding(.top, 100)
                    .padding(.leading, 50)
                
                }
            
            }
        
        .navigationTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
        }
    }
private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue Line", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)


#Preview {
    UpdatesDetails(update: mockUpdate)
}

