//
//  UpdatesPageList.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct UpdatesPageList: View {
    @State private var updates: [News] = []
    @State private var selectedLines: Set<String> = []
    @State private var selectedTags: Set<String> = []
    @State private var selectedStations: Set<String> = []
    
    var filteredUpdates: [News]{
        updates.filter{update in
            (selectedLines.isEmpty || selectedLines.contains(update.line)) &&
            (selectedTags.isEmpty || selectedTags.contains(update.tag)) &&
            (selectedStations.isEmpty || selectedStations.contains(update.station))
        }
        .sorted {
            ($0.timePosted ?? Date.distantPast) > ($1.timePosted ?? Date.distantPast)
        }
    }

    
    var availableLines: [String] {
        Set(updates.map { $0.line }).sorted()
    }
    
    var availableTags: [String] {
        Set(updates.map { $0.tag }).sorted()
    }
    
    var availableStations: [String] {
        Set(updates.map { $0.station }).sorted()
    }
    
    var body: some View {
        
         NavigationSplitView {
             VStack {
                 HStack{
                     Menu{
                         Button("Select All Lines"){
                             selectedLines = Set(availableLines)
                             
                         }
                         Button("Remove All Lines"){
                             selectedLines.removeAll()
                         }
                         ForEach(availableLines, id: \.self){line in
                             Button{
                                 if selectedLines.contains(line){
                                     selectedLines.remove(line)
                                 }
                                 else{
                                     selectedLines.insert(line)
                                 }
                             }label:{
                                 HStack{
                                     Text(line)
                                     if selectedLines.contains(line){
                                         Spacer()
                                         Image(systemName: "checkmark")
                                     }
                                 }
                             }
                         }
                     }
                     label: {
                         Label("Lines (\(selectedLines.count))", systemImage: "line.horizontal.3.decrease.circle")
                     }
                     .padding(.leading, 10)
                     
                     Menu{
                         Button("Select All Tags"){
                             selectedTags = Set(availableTags)
                             
                         }
                         Button("Remove All Tags"){
                             selectedTags.removeAll()
                         }
                         ForEach(availableTags, id: \.self){tag in
                             Button{
                                 if selectedTags.contains(tag){
                                     selectedTags.remove(tag)
                                 }
                                 else{
                                     selectedTags.insert(tag)
                                }
                             }label:{
                                 HStack{
                                     Text(tag)
                                     if selectedTags.contains(tag){
                                         Spacer()
                                         Image(systemName: "checkmark")
                                     }
                                 }
                             }
                         }
                     }label: {
                         Label("Tags (\(selectedTags.count))", systemImage: "tag.circle")
                     }
                     .padding(.leading, 10)
                     .padding(.trailing, 10)
                     
                     Menu{
                         Button("Select All Stations"){
                             selectedStations = Set(availableStations)
                             
                         }
                         Button("Remove All Stations"){
                             selectedStations.removeAll()
                         }
                         ForEach(availableStations, id: \.self){station in
                             Button{
                                 if selectedStations.contains(station){
                                     selectedStations.remove(station)
                                 }
                                 else{
                                     selectedStations.insert(station)
                                 }
                             }label:{
                                 HStack{
                                     Text(station)
                                     if selectedStations.contains(station){
                                         Spacer()
                                         Image(systemName: "checkmark")
                                     }
                                 }
                             }
                         }
                     }label: {
                         Label("Stations (\(selectedStations.count))", systemImage: "mappin.and.ellipse")
                     }
                     .padding(.trailing, 10)
                 }
                 List(filteredUpdates) { update in
                     NavigationLink {
                         UpdatesDetails(update: update)
                     } label: {
                         UpdatesPageRow(updatespage: update)
                             .frame(maxWidth: .infinity)
                             .contentShape(Rectangle())
                     }
                 }
                 .refreshable{
                     await refreshData()
                 }
                 .navigationTitle("Updates")
                 .listStyle(.plain)
                 .onAppear{
                     Task{
                         updates = await loadData()
                     }
                 }
             }
            

            

            
        } detail: {
            Text("Select an update")
        }
    }
    
    func refreshData() async{
        updates = await loadData()
    }
}



#Preview {
    UpdatesPageList()
}
