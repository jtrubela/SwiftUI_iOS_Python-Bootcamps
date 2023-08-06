//
//  Crew.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/27/23.
//

import Foundation
import SwiftUI


struct CrewRole: Codable {
    let name: String
    let role: String
}
struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
