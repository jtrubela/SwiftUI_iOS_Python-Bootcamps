//
//  HighlightsView.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/27/23.
//

import Foundation
import SwiftUI

struct HighlightView: View {
    
    var mission: Mission
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)
            
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)
            
            Text(mission.description)
            
        }
        .padding(.horizontal)
    }
}
