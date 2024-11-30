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

    





