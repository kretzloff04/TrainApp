//
//  MakeReportView.swift
//  CTA Safety
//
//  Created by student on 10/25/24.
//

import SwiftUI

struct MakeReportView: View {
    var body: some View {
        MakeReportViews()
    }
}

#Preview {
    MakeReportView()
}

struct MakeReportViews: View{
    
    var body: some View{
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
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 2)
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
                            .stroke(Color.red, lineWidth: 2)
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
                            .stroke(Color.red, lineWidth: 2)
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
                            .stroke(Color.red, lineWidth: 2)
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

