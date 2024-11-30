//
//  SwiftUIView.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI

struct UpdatesDetails: View {
    @State private var hasFlagged = false
    @State private var flagCount = 0
    @State private var showConfirmationDialog = false

    
    var update: News
    
    var body: some View {
        ScrollView {
            MapPreviewUpdate(update: update)
                .frame(height: 300)
                .cornerRadius(22)
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
                
                Divider()
                    .padding(.horizontal)
                
                // Flagging Button
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
        }
        .navigationTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
        
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

#Preview {
    UpdatesDetails(update: Updates[0])
}

