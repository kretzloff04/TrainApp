//
//  MakeReportView.swift
//  CTA Safety
//
//  Created by student on 10/25/24.
//

import SwiftUI

struct MakeReportView: View {
    
    var lineColor: Color
    var stopsImage: Image
    var listOfStops: [String]
    var dictOfStops: [String: (latitude: Double, longitude: Double)]
    var line: String
    
    @State private var showActionSheet = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("ctaMap")
                    .resizable()
                    .frame(width: 1000, height:1500)
                    .opacity(0.15)
                    .zIndex(0)
                VStack{
                    Button(action: {
                        showActionSheet = true
                    }) {
                        Text("Call For Help")
                            .frame(width: 125, height: 35)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                            .foregroundColor(Color.white)
                            .cornerRadius(0.5)
                    }
                    .padding(.leading, 250)
                    .zIndex(1)
                    
                    
                    if stopsImage == Image("redLineStops") || stopsImage == Image("brownLineStops") || stopsImage == Image("blueLineStops") || stopsImage == Image("orangeLineStops") || stopsImage == Image("purpleLineStops"){
                        stopsImage
                            .resizable()
                            .scaledToFill()
                            .frame(width:275, height: 350)
                            .padding(.bottom, 10)
                    }
                    else if stopsImage == Image("greenLineStops") || stopsImage == Image("pinkLineStops"){
                        stopsImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 250)
                    }
                    else if stopsImage == Image("yellowLineStops"){
                        stopsImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        
                    }
                    
                    
                    makeReportButton(title: "Report Smoking", lineColor: lineColor, listOfStops: listOfStops, dictOfStops: dictOfStops, line: line)
                    makeReportButton(title: "Report Loud Disruptions", lineColor: lineColor, listOfStops: listOfStops, dictOfStops: dictOfStops, line: line)
                    makeReportButton(title: "Report Physical Altercation", lineColor: lineColor, listOfStops: listOfStops, dictOfStops: dictOfStops, line: line)
                    makeReportButton(title: "Report Other", lineColor: lineColor, listOfStops: listOfStops, dictOfStops: dictOfStops, line: line)
                    
                }
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Emergency Call"),
                message: Text("Choose a number to call:"),
                buttons: [
                    .default(Text("Call 911")) {
                        if let url = URL(string: "tel://911") {
                            UIApplication.shared.open(url)
                        }
                    },
                    .default(Text("Call 211")) {
                        if let url = URL(string: "tel://211") {
                            UIApplication.shared.open(url)
                        }
                    },
                    .cancel()
                ]
            )
        }
    }
}


#Preview {
    MakeReportView(lineColor: Color("customRed"), stopsImage: Image("purpleLineStops"), listOfStops: Array(StopsData.listOfBlue.keys), dictOfStops: StopsData.listOfRed, line: "Red")
}

struct makeReportButton: View{
    var title: String
    var lineColor: Color
    var listOfStops: [String]
    var dictOfStops: [String: (latitude: Double, longitude: Double)]
    var line: String
    
    
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(lineColor), lineWidth: 2)
                .frame(width: 300, height: 50)
            NavigationLink(destination: ReportDescriptionView(listOfStops: listOfStops, dictOfStops: dictOfStops, tag: extractAction(from: title), lineColor: lineColor, line: line)){
                Text(title)
                    .frame(width: 300, height: 50)
                    .foregroundColor(Color.black)
                    .background(Color("customReportGrey"))
                    .cornerRadius(10)
                
            }.padding()
        }
        
                
    }
    private func extractAction(from title: String) -> String{
        if let actionIndex = title.firstIndex(of: " ") {
            let actionPart = title[title.index(after: actionIndex)...]
            return String(actionPart)
        }
        return title
    }

}


