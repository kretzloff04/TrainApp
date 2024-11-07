//
//  ReportDescriptionView.swift
//  CTA Safety
//
//  Created by student on 10/30/24.
//

import SwiftUI

struct ReportDescriptionView: View {
    @State private var titleInput:String = ""
    @State private var descriptionInput:String = ""
    @State private var priorityLevelInput: Int = 0
    @State private var priorityIsActive: Bool = false
    @State private var location: String = ""
    @State private var whenHappened: String = ""
    var listOfStops: [String]
    @State var tag: String = ""
    var lineColor: Color
    
    
        var body: some View {
        ZStack{
            Image("ctaMap")
                .resizable()
                .frame(width: 1000, height:1500)
                .opacity(0.15)
            VStack(spacing: -20){
                Text("Title")
                    .font(.system(size: 25))
                TextField("Title", text: $titleInput)
                    .frame(width: 350, height: 100)
                    .textFieldStyle(.roundedBorder)
                    .colorMultiply(Color("textFieldColor"))

                Text("Description")
                    .padding(.bottom, 50)
                    .font(.system(size: 25))
                
                ZStack{
                    TextEditor(text: $descriptionInput)
                        .colorMultiply(Color("textFieldColor"))
                        .frame(width: 350, height: 100)
                        .cornerRadius(10)
                    
                    if descriptionInput == ""{
                        Text("Description")
                            .padding(.trailing, 325)
                            .padding(.bottom, 75)
                    }
                }
                
                
               
                HStack(alignment: .firstTextBaseline){
                    VStack{
                        Text("Location")
                            .padding(.top,50)
                            .font(.system(size:25))
                            .padding(.trailing, 20)
                        LocationPicker(listOfStops: listOfStops, location: "")
                            .frame(width: 160, height: 50)
                            .accentColor(.black)
                            .background(Color("textFieldColor"))
                            .cornerRadius(10)
                            .padding(.trailing, 20)
                    }
                    
                    VStack{
                        Text("Tag")
                            .font(.system(size: 25))
                            .padding(.bottom, 10)
                            .padding(.leading, 20)
                        Picker("Select a tag", selection: $tag){
                            Text("Smoking")
                                .tag("Smoking")
                            Text("Loud Disruptions")
                                .tag("Loud Disruptions")
                            Text("Physical Altercation")
                                .tag("Physical Altercation")
                            Text("Other")
                                .tag("Other")
                            
                        }
                        .frame(width: 160, height: 50)
                        .accentColor(.black)
                        .background(Color("textFieldColor"))
                        .cornerRadius(10)
                        .padding(.leading, 20)
                        .font(.system(size: 1))
                        
                    }

                }
                
                VStack{
                    Text("When Did This Happen?")
                        .font(.system(size: 25))
                        
                    Picker("Select a time", selection: $whenHappened){
                        Text("While Waiting at Stop")
                            .tag("While Waiting at Stop")
                        Text("On Train")
                            .tag("On Train")
                    }
                    .frame(width: 160, height: 50)
                    .accentColor(.black)
                    .background(Color("textFieldColor"))
                    .cornerRadius(10)
                    .padding(.leading, 20)
                    .font(.system(size: 1))
                }
                .padding(.top, 30)
                
                Text("Priority Level")
                    .padding(.top, 50)
                    .font(.system(size: 30))
                    .padding(.bottom, 10)
                
                HStack{
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 1, colorInput: Color("priorityGreen"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 2, colorInput: Color("priorityYellow"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 3, colorInput: Color("priorityOrange"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 4, colorInput: Color("priorityRed"))

                }.padding(.top, 20)
                
                Button("Post", action: {
                    
                })
                .padding(.top, 30)
                .accentColor(Color.black)
                .background(lineColor)
            }
            .frame(width: 350, height: 200)
            
                    
            }
        }
    }


#Preview {
    ReportDescriptionView(listOfStops: StopsData.listOfBlue, tag: "Smoking", lineColor: Color("customPurple"))
}

struct priorityLevelBtn: View{
    @Binding var priorityLevelInput: Int
    var num: Int
    @State var colorInput: Color
    var body: some View{
        
        Button("\(num)", action: {
            priorityLevelInput = num
            
        })
        .frame(width:40, height: 40)
        .foregroundColor(.black)
        .background(priorityLevelInput == num ? colorInput : Color("textFieldColor"))
        .cornerRadius(10)
        .padding(.trailing, 10)
    }
    
}

struct LocationPicker: View {
    @State var listOfStops: [String]
    @State var location: String
    private let lengthOfListOfStops: Int
    
    init(listOfStops: [String], location: String) {
        self.listOfStops = listOfStops
        self.location = location
        self.lengthOfListOfStops = listOfStops.count
    }
    
    var body: some View {
        Picker("Select a location", selection: $location) {
            ForEach(0..<lengthOfListOfStops, id: \.self) { i in
                Text(listOfStops[i])
                    .tag(listOfStops[i])
            }
        }
        
    }
}


