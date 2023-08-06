//
//  MissionView.swift
//  Moonshot
//
//  Created by Justin Trubela on 05/30/2023
//

import SwiftUI


struct MissionImage: View {
    var imageName: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding(.top)
        }
    }
}


struct MissionInfo: View {
    
    var mission: Mission
    
    var body: some View {
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundColor(.white)
            HStack{
                Text("Launched:").italic()
                
                Text(mission.formattedLaunchDate)
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
    }
}

struct MissionCard: View {
    var mission: Mission
    
    var body: some View {
        VStack{
            MissionImage(imageName: mission.image)
                .frame(width: 150, height: 150)
            
            MissionInfo(mission: mission.self)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

struct MissionGridView: View {
    let control = MissionControl()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
        
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(control.missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: control.astronauts)
                } label: {
                    MissionCard(mission: mission)
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionListView: View {
    let control = MissionControl()
    
//    var mission: Mission

    
    var body: some View {
        ForEach(control.missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: control.astronauts)
            } label: {
                MissionCard(mission: mission)
            }
        }
    }
}


struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //Image
                    MissionImage(imageName: mission.image)
                        .frame(maxWidth: geometry.size.width * 0.6)
                    
                    //Highlights - Title and description
                    HighlightView(mission: mission, description: mission.description)

                    
                    //Astronaut Image Links
                    CrewView(crew: crew)
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let control: MissionControl = MissionControl()
    
    
    static var previews: some View {
        MissionView(mission: control.missions[0], astronauts: control.astronauts)
            .preferredColorScheme(.dark)
    }
}
