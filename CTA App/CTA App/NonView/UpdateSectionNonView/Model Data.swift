//
//  Model Data.swift
//  CTA Practice2.0
//
//  Created by 2 GO Participant on 11/6/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import CoreLocation
import SwiftUI


//News struct that represents the data that is stored by every created post.
struct News: Hashable, Codable, Identifiable {
    var description: String
    var id: String // Firestore ID
    var line: String
    var numReports: Int
    var priorityLevel: Int
    var station: String
    var tag: String
    var title: String
    var whenHappened: String
    var timePosted: Date?
    var latitude: Double
    var longitude: Double
    
    

}

var Updates: [News] = []

let db = Firestore.firestore()


//function that loads data from the firestore database and returns an array filled with News objects.
func loadData() async -> [News]{
    let db = Firestore.firestore()
    var tempArray : [News] = []
    let currentDate = Date()
    
    do{
        
        let querySnapshot = try await db.collection("updates").getDocuments()
        
        //Documents is an array that holds the collection's documents.
        let documents = querySnapshot.documents
        
        //Iterates through the array of documents and sets these temporary constants to the corresponding values. Ensures that no values are defaulted to nil as ?? assigns each constant to a default value.
        for document in documents {
            let data = document.data()
            let id = document.documentID
            let description = data["description"] as? String ?? ""
            let latitude = data["latitude"] as? Double ?? 0.0
            let longitude = data["longitude"] as? Double ?? 0.0
            let line = data["line"] as? String ?? ""
            let numReports = data["numReports"] as? Int ?? 0
            let priorityLevel = data["priorityLevel"] as? Int ?? 0
            let station = data["station"] as? String ?? ""
            let tag = data["tag"] as? String ?? ""
            let title = data["title"] as? String ?? ""
            let whenHappened = data["whenHappened"] as? String ?? ""
            let timestamp = (data["timePosted"] as? Timestamp)?.dateValue()

            if let timestamp = timestamp, currentDate.timeIntervalSince(timestamp) > 14 * 24 * 60 * 60{
                try await db.collection("updates").document(id).delete()
                continue
            }
            
            //Creates a News object that is made of the constants above.
            let newsItem = News(
                description: description,
                id: id,
                line: line,
                numReports: numReports,
                priorityLevel: priorityLevel,
                station: station,
                tag: tag,
                title: title,
                whenHappened: whenHappened,
                timePosted: timestamp,
                latitude: latitude,
                longitude: longitude
                
            )
            
            tempArray.append(newsItem)
        }
        

    }
    catch{
        print("error")
    }
    
    return tempArray
    
}






func createStat(line: String, tag: String, station: String) async{
    let statRef = db.collection("stats").document()
    let docID = statRef.documentID
    
    let data: [String: Any] = [
        "id" : docID,
        "line" : line,
        "tag" : tag,
        "station" : station,
        "totalReports" : 1
    ]
    
    do{
        try await statRef.setData(data)
    }
    catch{
        print("Cannot add stat data to database")
    }
}

func getStat(line: String, tag: String, station: String) async -> DocumentSnapshot?{
    let query = db.collection("stats")
        .whereField("line", isEqualTo: line)
        .whereField("tag", isEqualTo: tag)
        .whereField("station", isEqualTo: station)
    
    do{
        let querySnapshot = try await query.getDocuments()
        return querySnapshot.documents.first
    }
    catch{
        print("Could not retrieve statistic")
        return nil
    }
}

func incrementStat(line: String, tag: String, station: String) async{
    if let snapshot = await getStat(line: line, tag: tag, station: station){
        let statRef = snapshot.reference
        
        do{
            try await statRef.updateData([
                "totalReports": FieldValue.increment(Int64(1))
            ])
        }
        catch{
            print("Could not increment")
        }
    }
    else{
        print("Document was not retrieved")
    }
}

func numReportsPerLine() async -> [String : Int]{
    let db = Firestore.firestore()
    var reportsPerLine: [String: Int] = [:]
    
    do{
        let querySnapshot = try await db.collection("stats").getDocuments()
        
        for document in querySnapshot.documents{
            let data = document.data()
            
            let line = data["line"] as? String ?? ""
            let totalReports = data["totalReports"] as? Int ?? 0
            
            reportsPerLine[line, default: 0] += totalReports
        }
    }
    catch{
        print("Could not retrieve stats data (numReportsPerLine")
    }
    return reportsPerLine
}

func numReportOneLine(input: String) async -> [String : Int]{
    let db = Firestore.firestore()
    var reportsPerInput: [String: Int] = [:]
    
    do{
        let querySnapshot = try await db.collection("stats").whereField("line", isEqualTo: input).getDocuments()
        for document in querySnapshot.documents{
            let data = document.data()
            
            
            let key = data["station"] as? String ?? ""
            let totalReports = data["totalReports"] as? Int ?? 0
            
            reportsPerInput[key, default: 0] += totalReports
            
        }
    }
    catch{
        print("Could not retrieve numReportOneLine")
    }
    return reportsPerInput
}

func totalReportsAllTime() async -> Int{
    let db = Firestore.firestore()
    var overallReports = 0
    do{
        let querySnapshot = try await db.collection("stats").getDocuments()
        for document in querySnapshot.documents{
            let data = document.data()
            
            if let totalReports = data["totalReports"] as? Int{
                overallReports = overallReports + totalReports
            }
            else{
                print("Error, wrong type")
            }
        }
    }
    catch{
        print("Could not retrieve stats data (totalReportsAllTime)")
    }
    return overallReports
}


struct LineReport: Identifiable{
    let id = UUID()
    let line: String
    let totalReports: Int
}

func transformReportsData(_ reports: [String: Int]) -> [LineReport] {
    reports.map { LineReport(line: $0.key, totalReports: $0.value) }
}


func lineColor(line: String) -> Color{
    if(line == "Red"){
        return Color("customRed")
    }
    else if(line == "Blue"){
        return Color("customBlue")
    }
    else if(line == "Brown"){
        return Color("customBrown")
    }
    else if(line == "Purple"){
        return Color("customPurple")
    }
    else if(line == "Yellow"){
        return Color("customYellow")
    }
    else if(line == "Pink"){
        return Color("customPink")
    }
    else if(line == "Green"){
        return Color("customGreen")
    }
    else{
        return Color("customOrange")
    }
}






extension Color{
    static var random: Color{
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
}
