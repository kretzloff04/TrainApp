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
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Red Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customRed"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Blue Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customBlue"))
                                .cornerRadius(10)
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Brown Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customBrown"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Green Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customGreen"))
                                .cornerRadius(10)
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Orange Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customOrange"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Pink Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customPink"))
                                .cornerRadius(10)
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Purple Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customPurple"))
                                .cornerRadius(10)
                        }
                    }.padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 300, height: 50)
                        NavigationLink(destination: MakeReportView()){
                            Text("Yellow Line")
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.white)
                                .background(Color("customYellow"))
                                .cornerRadius(10)
                        }
                    }
                   
                }
                .padding(.bottom, 80)
            }
            
        }
    }
}

#Preview {
    ReportView()

}


