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
    
        var body: some View {
        ZStack{
            Image("ctaMap")
                .resizable()
                .frame(width: 1000, height:1500)
                .opacity(0.15)
            VStack(spacing: -20){
                Text("Title")
                    .font(.system(size: 30))
                TextField("Title", text: $titleInput)
                    .frame(width: 350, height: 100)
                    .textFieldStyle(.roundedBorder)
                    .colorMultiply(Color("textFieldColor"))

                   

                    
                    
                Text("Description")
                    .padding(.bottom, 50)
                    .font(.system(size: 30))
                
                TextEditor(text: $descriptionInput)
                    .colorMultiply(Color("textFieldColor"))
                    .frame(width: 350, height: 100)
                    .cornerRadius(10)
                
                Text("Priority Level")
                    .padding(.top, 100)
                    .font(.system(size: 30))
                
                
                
                HStack{
                    
                    
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 1, colorInput: Color("priorityGreen"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 2, colorInput: Color("priorityYellow"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 3, colorInput: Color("priorityOrange"))
                    priorityLevelBtn(priorityLevelInput: $priorityLevelInput, num: 4, colorInput: Color("priorityRed"))

                }.padding(.top, 20)
                
            }
            .frame(width: 350, height: 200)
                    
                
            }
        }
    }


#Preview {
    ReportDescriptionView()
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
