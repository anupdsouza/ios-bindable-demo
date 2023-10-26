//
//  Schedule.swift
//  BindableDemo
//
//  Created by Anup D'Souza on 26/10/23.
//

import SwiftUI
import FirebaseFirestore

@Observable
class Schedule {
    
    var schedule = [Event]()
    var searchText: String = ""
    
    var searchedEvents: [Event] {
        if searchText.isEmpty {
            schedule
        } else {
            schedule.filter { $0.title.localizedStandardContains(searchText) }
        }
    }
    
    func getSchedule() async {
        let db = Firestore.firestore()
        let docRef = db.collection("events")
        
        let querySnapshot = try? await docRef.getDocuments()
        
        var events = [Event]()
        
        if let querySnapshot {
            for document in querySnapshot.documents {
                if let event = try? document.data(as: Event.self) {
                    events.append(event)
                }
            }
            self.schedule = events
        }
    }
    
    func saveSchedules() {
        do {
            try Firestore
                .firestore()
                .collection("events")
                .addDocument(from: Event(title: "Archery", date: Date()))
            try Firestore
                .firestore()
                .collection("events")
                .addDocument(from: Event(title: "Swimming", date: Date()))
        }
        catch {}
    }
}
