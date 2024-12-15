//
//  ContentView.swift
//  CTA Safety
//
//  Created by student on 10/14/24.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView{
            
            ReportView()
                .tabItem{
                    Label("Report", systemImage: "exclamationmark.bubble")
                }
            
            
            F_MapView()
                .tabItem{
                    Label("Map", systemImage: "pin")
                }
            
            UpdatesPageList()
                .tabItem{
                    Label("Updates", systemImage: "arrow.up.circle")
                }
            
            
            
            
        }
    }
}

#Preview {
    ContentView()
}



