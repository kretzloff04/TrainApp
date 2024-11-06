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
            F_MapView()
                .tabItem{
                    Label("Map", systemImage: "map")
                }
            
            ReportView()
                .tabItem{
                    Label("Report", systemImage: "exclamationmark.bubble")
                }
            
            
        }
    }
}

#Preview {
    ContentView()
}
