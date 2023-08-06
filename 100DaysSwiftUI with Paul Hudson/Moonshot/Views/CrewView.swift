//
//  CrewView.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/30/23.
//

import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightBackground)
                    .padding(.vertical)
                
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom, 5)
            }
            .padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautInfo(astronaut: crewMember.astronaut)
                        } label: {
                            AstronautCard(crewMember: crewMember)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}
