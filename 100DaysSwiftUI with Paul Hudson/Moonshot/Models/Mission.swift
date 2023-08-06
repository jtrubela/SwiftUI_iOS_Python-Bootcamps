//
//  MissionViewControl.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/27/23.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    let id: Int
    
    let launchDate: Date?
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    let crew: [CrewRole]
    
    var image: String {
        "apollo\(id)"
    }
    var displayName: String {
        "Apollo \(id)"
    }
    
    let description: String
}

class MissionControl: ObservableObject {
    @Published var missions: [Mission] = Bundle.main.decode("missions.json")
    @Published var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
}
