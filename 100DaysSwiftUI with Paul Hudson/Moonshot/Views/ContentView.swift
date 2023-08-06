//
//  ContentView.swift
//  Moonshot
//
//  Created by Justin Trubela on 05/30/2023
//

import SwiftUI

struct ContentView: View {
    let control = MissionControl()

//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
//
    var pickerChoices = [
        "List", "Grid"
    ]
    
    
    enum listView {
        case List, Grid
    }

    
    @State var listChoice: listView = .Grid

    
    var body: some View {
        NavigationView {
            ScrollView {
                if listChoice == .Grid{
                    MissionGridView()
                }
                else {
                    MissionListView()
            }
                
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Picker(selection: $listChoice, label: Text("Choose View type")) {
                        Text("Grid").tag(listView.Grid)
                        Text("List").tag(listView.List)
                    }
                    .pickerStyle(.inline)
                        .font(.largeTitle)
                    
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
