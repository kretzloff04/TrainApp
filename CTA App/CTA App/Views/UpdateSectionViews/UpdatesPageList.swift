//
//  UpdatesPageList.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct UpdatesPageList: View {
    @State private var updates: [News] = []
    
    var body: some View {
        
         NavigationSplitView {
            
                List(updates) { update in
                    NavigationLink {
                        UpdatesDetails(update: update)
                    } label: {
                        UpdatesPageRow(updatespage: update)
                    }
                }
                .navigationTitle("Updates")
                .onAppear{
                    Task{
                        updates = await loadData()
                    }
                }
            

            
        } detail: {
            Text("Select an update")
        }
    }
}



#Preview {
    UpdatesPageList()
}
