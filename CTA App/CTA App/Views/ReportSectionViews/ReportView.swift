//
//  ReportView.swift
//  CTA Safety
//
//  Created by student on 10/15/24.
//

import SwiftUI

struct ReportView: View {
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Image("ctaMap")
                    .resizable()
                    .frame(width: 1000, height:1500)
                    .opacity(0.15)
                VStack{
                    Text("Call For Help")
                        .frame(width: 125, height: 35)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                        .padding(.leading, 250)
                        .foregroundColor(Color.white)
                        .cornerRadius(0.5)
                        
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

