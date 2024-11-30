//
//  ReportDescriptionView.swift
//  CTA Safety
//
//  Created by student on 10/30/24.
//

import SwiftUI
import CoreLocation
import Firebase
import FirebaseFirestore

struct ReportDescriptionView: View {
    @State private var titleInput:String = ""
    @State private var descriptionInput:String = ""
    @State private var priorityLevelInput: Int = 0
    @State private var priorityIsActive: Bool = false
    @State private var station: String = "N/A"
    @State private var whenHappened: String = ""
    var listOfStops: [String]
    var dictOfStops: [String: (latitude: Double, longitude: Double)]
    @State var tag: String = ""
    var lineColor: Color
    var line: String
    let db = Firestore.firestore()
    
    
    
    
        var body: some View {
        ZStack{
            Image("ctaMap") //Background image
                .resizable()
                .frame(width: 1000, height:1500)
                .opacity(0.15)
            
            //Overall VStack that organizes the vertical component of the entire page.
            VStack(spacing: -20){
                Text("Title")
                    .font(.system(size: 25))
                
                //The title TextField. A ZStack is used to display the border.
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                        .frame(width: 350, height: 34)
                    
                    TextField("Title", text: $titleInput)
                        .textFieldStyle(.roundedBorder)
                        .colorMultiply(Color("textFieldColor"))
                        .cornerRadius(10)
                        .frame(width: 350, height: 100)
                }
                
                Text("Description")
                    .padding(.bottom, 35)
                    .font(.system(size: 25))
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                        .frame(width: 350, height: 100)
                    
                    TextEditor(text: $descriptionInput)
                        .colorMultiply(Color("textFieldColor"))
                        .cornerRadius(10)
                        .frame(width: 350, height: 100)
                    
                    if descriptionInput == ""{
                        Text("Description")
                            .padding(.trailing, 325)
                            .padding(.bottom, 75)
                    }
                }

                HStack(alignment: .firstTextBaseline){
                    VStack{
                        Text("Station")
                            .padding(.top,50)
                            .font(.system(size:25))
                            .padding(.trailing, 20)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 160, height: 50)
                            LocationPicker(listOfStops: listOfStops, station: $station)
                                .frame(width: 160, height: 50)
                                .accentColor(.black)
                                .background(Color("textFieldColor"))
                                .cornerRadius(10)
                        }
                        .padding(.trailing, 20)
                    }
                    
                    VStack{
                        Text("Tag")
                            .font(.system(size: 25))
                            .padding(.bottom, 10)
                            .padding(.leading, 20)
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 160, height: 50)
                                .padding(.leading, 20)
                            Picker("Select a tag", selection: $tag){
                                Text("Smoking")
                                    .tag("Smoking")
                                Text("Loud Disruptions")
                                    .tag("Loud Disruptions")
                                Text("Physical Altercation")
                                    .tag("Physical Altercation")
                                Text("Vandalism")
                                    .tag("Vandalism")
                                Text("Robbery/Theft")
                                    .tag("Robbery/Theft")
                                Text("Drug Use")
                                    .tag("Drug Use")
                                Text("Harassment")
                                    .tag("Harassment")
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

                }
                
                VStack{
                    Text("When Did This Happen?")
                        .font(.system(size: 25))
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 160, height: 50)
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
                        .font(.system(size: 1))
                    }
                    
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
                
                Button(action: {
                    Task{
                        do{
                            print("Selected Station: \(station)")
                            guard let stopCoordinates = dictOfStops[station] else {
                                print("Error: No coordinates found for the line \(station)")
                                return
                            }
                            
                            try await db.collection("updates").document().setData([
                                "description" : descriptionInput,
                                "latitude" : stopCoordinates.latitude,
                                "line" : line,
                                "longitude" : stopCoordinates.longitude,
                                "numReports" : 0,
                                "priorityLevel" : priorityLevelInput,
                                "station" : station,
                                "tag" : tag,
                                "timePosted" : FieldValue.serverTimestamp(),
                                "title" : titleInput,
                                "whenHappened" : whenHappened
                                ])
                                print("Success")
                            }
                            catch{
                                print("Failed")
                        }
                    }

                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 300, height: 50)
                        Text("Post")
                            .frame(width: 300, height: 50)
                            .foregroundColor(Color.white)
                            .background(lineColor)
                            .cornerRadius(10)
                    }
                    
                }
                .padding(.top, 100)
                
            }
            .frame(width: 350, height: 200)
            
                    
            }
        }
    }


#Preview {
    ReportDescriptionView(listOfStops: Array(StopsData.listOfBlue.keys), dictOfStops: StopsData.listOfBlue, tag: "Smoking", lineColor: Color("customPurple"), line: "Red")
}

//Priority buttons
struct priorityLevelBtn: View{
    @Binding var priorityLevelInput: Int
    var num: Int
    @State var colorInput: Color
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
            
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
    
}

struct LocationPicker: View {
    var listOfStops: [String]
    @Binding var station: String
    
    var body: some View {
        Picker("Select a station", selection: $station) {
            ForEach(listOfStops, id: \.self) { stop in
                Text(stop)
                    .tag(stop)
            }
        }
    }
}

struct LocationCoordinate: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}





