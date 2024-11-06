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
    @State private var priorityLevelInput: Bool = false
    var body: some View {
        ZStack{
            Image("ctaMap")
                .resizable()
                .frame(width: 1000, height:1500)
                .opacity(0.15)
            VStack(spacing: -20){
                Text("Title")
                TextField("Title", text: $titleInput)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 350, height: 100)
                Text("Description")
                if descriptionInput.isEmpty {
                                Text("Enter your description here")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                            
                            TextEditor(text: $descriptionInput)
                                .padding(4)
                                .border(Color.gray, width: 1)
                                .cornerRadius(5)
                        }
                        .frame(width: 350, height: 200)
                    
                
            }
        }
    }


#Preview {
    ReportDescriptionView()
}
