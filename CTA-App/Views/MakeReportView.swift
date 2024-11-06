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
    var body: some View {
        NavigationView{
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
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(lineColor), lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: ReportDescriptionView()){
                            Text("Report Smoking")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color("customReportGrey"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(lineColor), lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: ReportDescriptionView()){
                            Text("Report Loud Disruptions")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color("customReportGrey"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(lineColor), lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MapView()){
                            Text("Report Physical Altercation")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color("customReportGrey"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(lineColor), lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MapView()){
                            Text("Report Other")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color("customReportGrey"))
                                .cornerRadius(10)
                        }
                    }.padding()
                }
            }
        }

    }
}

#Preview {
    MakeReportView(lineColor: Color("customRed"), stopsImage: Image("purpleLineStops"))
}

