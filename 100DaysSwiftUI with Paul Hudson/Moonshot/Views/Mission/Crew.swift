//
//  CrewView.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/27/23.
//

import Foundation
import SwiftUI



struct CrewView: View {
    var missionTitle: String
    var crew: [CrewMember]
    
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .showCrewMember()
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
//                    .navigationTitle(missionTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .background(.darkBackground)
                }
            }
        }
        
    }
}

struct CrewMemberImage: ViewModifier {
    func image(image: Image) -> some View {
        image
            .resizable()
    }
    func body(content: Content) -> some View {
       
        content
            .frame(width: 104, height: 72)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(.white, lineWidth: 1)
            )
    }
}
extension View {
    func showCrewMember() -> some View {
        modifier(CrewMemberImage())
    }
}
