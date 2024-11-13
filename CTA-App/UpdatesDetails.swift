//
//  SwiftUIView.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI

struct UpdatesDetails: View {
    var update: News
    
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
                }
            }
        
        .navigationTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
        }
    }


#Preview {
    UpdatesDetails(update: Updates[0])
}

