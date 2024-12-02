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
    @State private var hasFlagged = false
    @State private var flagCount = 0
    @State private var showConfirmationDialog = false
    
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
                
                
                HStack {
                    Text("Station: \(update.station)" )
                    Spacer()
                    Text("Posted \(postedTimeAgo)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                
                Text("Line: \(update.line)" )
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                HStack{
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
                    Spacer()
                    if(update.whenHappened != ""){
                        Text("Happened \(update.whenHappened)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }
                }
                
                
                
                Divider()
                    .padding(.horizontal)
                
                // Description text
                Text(update.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                Button(action: {
                    showConfirmationDialog = true
                }) {
                    Text(hasFlagged ? "Undo Flag" : "Flag Update")
                        .foregroundColor(hasFlagged ? .gray : .red)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(22)
                }
                .padding(.horizontal)
                .confirmationDialog("Are you sure you want to \(hasFlagged ? "undo the flag for this update?" : "flag this update? This may lead to its removal.")", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                    
                    Button(hasFlagged ? "Undo Flag" : "Flag", role: .destructive) {
                        toggleFlag()
                    }
                    Button("Cancel", role: .cancel) {}
                }
            }
            .navigationTitle(update.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func checkFlagCount() {
        if flagCount >= 5 {
            print("This update needs to be reviewed!")
        }
    }
    private func toggleFlag() {
        hasFlagged.toggle()
        flagCount += hasFlagged ? 1 : -1
        if flagCount < 0 { flagCount = 0 } // Safety check
    }
}
    
private let mockUpdate = News(description: "Test Update 2", id: "2", line: "Blue", numReports: 0, priorityLevel: 2, station: "Station 2", tag: "Accident", title: "Test Title 2", whenHappened: "2024-11-29", timePosted: Date(), latitude: 41.8837, longitude: -87.6298)


#Preview {
    UpdatesDetails(update: mockUpdate)
}

