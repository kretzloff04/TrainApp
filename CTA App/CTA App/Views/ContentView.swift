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
                    Label("Report", systemImage: "Map")
                }
            
            
            F_MapView()
                .tabItem{
                    Label("Map", systemImage: "Map")
                }
            
            UpdatesPageList()
                .tabItem{
                    Label("Upates", systemImage: "Map")
                }
            
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
