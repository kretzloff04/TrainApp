//
//  ReportView.swift
//  CTA Safety
//
//  Created by student on 10/15/24.
//

import SwiftUI

struct ReportView: View {
    
    @State private var showActionSheet = false
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Image("ctaMap")
                    .resizable()
                    .frame(width: 1000, height: 1500)
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
                    
                    Text("Select a Line")
                        .font(.system(size: 30))
                        .bold()
                    reportBtn(lineColor: "customRed", imageString: "redLineStops", title: "Red Line", listOfStops: Array(StopsData.listOfRed.keys), dictOfStops: StopsData.listOfRed, line: "Red")
                        .padding()
                    reportBtn(lineColor: "customBlue", imageString: "blueLineStops", title: "Blue Line", listOfStops: Array(StopsData.listOfBlue.keys), dictOfStops: StopsData.listOfBlue, line: "Blue")
                    reportBtn(lineColor: "customBrown", imageString: "brownLineStops", title: "Brown Line", listOfStops: Array(StopsData.listOfBrown.keys), dictOfStops: StopsData.listOfBrown, line: "Brown")
                        .padding()
                    reportBtn(lineColor: "customGreen", imageString: "greenLineStops", title: "Green Line", listOfStops: Array(StopsData.listOfGreen.keys), dictOfStops: StopsData.listOfGreen, line: "Green")
                    reportBtn(lineColor: "customOrange", imageString: "orangeLineStops", title: "Orange Line", listOfStops: Array(StopsData.listOfOrange.keys), dictOfStops: StopsData.listOfOrange, line: "Orange")
                        .padding()
                    reportBtn(lineColor: "customPink", imageString: "pinkLineStops", title: "Pink Line", listOfStops: Array(StopsData.listOfPink.keys), dictOfStops: StopsData.listOfPink, line: "Pink")
                    reportBtn(lineColor: "customPurple", imageString: "purpleLineStops", title: "Purple Line", listOfStops: Array(StopsData.listOfPurple.keys), dictOfStops: StopsData.listOfPurple, line: "Purple")
                        .padding()
                    reportBtn(lineColor: "customYellow", imageString: "yellowLineStops", title: "Yellow Line", listOfStops: Array(StopsData.listOfYellow.keys), dictOfStops: StopsData.listOfYellow, line: "Yellow")
                }
                .padding(.bottom, 80)
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
}

#Preview {
    ReportView()

}

struct reportBtn: View{
    var lineColor: String
    var imageString: String
    var title: String
    var listOfStops: [String]
    var dictOfStops: [String: (latitude: Double, longitude: Double)]
    var line: String
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 300, height: 50)
            NavigationLink(destination: MakeReportView(lineColor: Color(lineColor), stopsImage: Image(imageString), listOfStops: listOfStops, dictOfStops: dictOfStops, line: line)){
                Text(title)
                    .frame(width: 300, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color(lineColor))
                    .cornerRadius(10)
            }
        }
    }
}

