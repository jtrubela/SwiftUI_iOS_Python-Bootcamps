//
//  Astronaut.swift
//  Moonshot
//
//  Created by Justin Trubela on 5/27/23.
//

import Foundation
import SwiftUI

struct AstronautImage: ViewModifier {
    func image(image: Image) -> some View {
        image
            .resizable()
    }
    
    func body(content: Content) -> some View {
        NavigationView{
            content
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
        }
    }
}
extension View {
    func showCrewMember() -> some View {
        modifier(AstronautImage())
    }
}

struct AstronautInfo: View {
    let astronaut: Astronaut
    
    var body: some View {
        HStack{
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
    }
}

struct AstronautCard: View {
    var crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
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
}
