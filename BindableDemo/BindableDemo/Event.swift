//
//  Event.swift
//  BindableDemo
//
//  Created by Anup D'Souza on 26/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Event: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let title: String
    let date: Date
}
