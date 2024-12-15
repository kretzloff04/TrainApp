//
//  LoadingScreen.swift
//  Rider Report
//
//  Created by 2 GO Participant on 12/12/24.
//
import SwiftUI

struct LoadScreen: View {
    @State private var isActive = false
    @State private var size = 1.0
    @State private var opacity = 1.0

    var body: some View {
        Group {
            if isActive {
                ContentView() // Transition to main content
            } else {
                VStack {
                    Text("Rider Report")
                        .font(.system(size: 46, weight: .bold))
                        .padding(.bottom, 10)
                    
                    Image("riderReportPin")
                        .resizable()
                        .frame(width: 224, height: 225)
                        .padding(.bottom, 70)
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.size = 0.5
                        self.opacity = 0.0
                    }
                    // Delay before showing the main content
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoadScreen()
}
