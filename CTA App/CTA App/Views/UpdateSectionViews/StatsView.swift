//
//  StatsView.swift
//  CTA App
//
//  Created by student on 12/13/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Charts

struct StatsView: View {
    let db = Firestore.firestore()
    @State var lineReports: [LineReport] = []
    @State private var selectedInput = "All Lines"
    var body: some View{
        ZStack{
            Image("ctaMap")
                .resizable()
                .frame(width: 1000, height:1500)
                .opacity(0.15)
            VStack{
//                Picker("x", selection: $selectedInput){
//                    Text("All Lines")
//                        .tag("All Lines")
//                    Text("Blue")
//                        .tag("Blue")
//                    Text("Brown")
//                        .tag("Brown")
//                    Text("Green")
//                        .tag("Green")
//                    Text("Orange")
//                        .tag("Orange")
//                    Text("Pink")
//                        .tag("Pink")
//                    Text("Purple")
//                        .tag("Purple")
//                    Text("Red")
//                        .tag("Red")
//                    Text("Yellow")
//                        .tag("Yellow")
//                    
//                }
//                .padding(.top, 50)
                
                Text("\(selectedInput)")
                    .font(.system(size: 34))
                    .frame(width: 500)
                    .padding(.trailing, 250)
                    .padding(.top, 20)
                
                Text("More Coming Soon...")
                
                if(selectedInput == "All Lines"){
                    PieChartView(selectedInput: "All Lines")
                }
                
                    
                
//                else if(selectedInput == "Red"){
//                    PieChartView(selectedInput: "Red")
//                }
//                else if(selectedInput == "Brown"){
//                    PieChartView(selectedInput: "Brown")
//                }
//                else if(selectedInput == "Purple"){
//                    PieChartView(selectedInput: "Purple")
//                }
//                else if(selectedInput == "Yellow"){
//                    PieChartView(selectedInput: "Yellow")
//                }
//                else if(selectedInput == "Green"){
//                    PieChartView(selectedInput: "Green")
//                }
//                else if(selectedInput == "Blue"){
//                    PieChartView(selectedInput: "Blue")
//                }
//                else if(selectedInput == "Orange"){
//                    PieChartView(selectedInput: "Orange")
//                }
//                else{
//                    PieChartView(selectedInput: "Pink")
//                }
            }
        }
    }
}

#Preview {
    StatsView()
}


