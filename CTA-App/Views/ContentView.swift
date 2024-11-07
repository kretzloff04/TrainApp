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
            MapView()
                .tabItem{
                    Label("Map", systemImage: "Map")
                }
            
            ReportView()
                .tabItem{
                    Label("Report", systemImage: "Map")
                }
            
            
        }
    }
}

#Preview {
    ContentView()
}
