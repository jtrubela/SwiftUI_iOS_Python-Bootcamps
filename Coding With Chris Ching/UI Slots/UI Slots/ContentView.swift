//
//  ContentView.swift
//  UI Slots
//
//  Created by Justin Trubela on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    
    //var slotItems: [String] //= ["apple","cherry","star"]
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    
    @State var credits = 1000
    
    var body: some View {
        
        
        VStack{
            
            Text("SwiftUI Slots!")
                .font(.largeTitle).padding()
            
            Spacer()
            
            HStack {
                Text("Credits:\(credits)").bold()
            }
            
            Spacer()
            
            HStack{
                Image("fruit" + String(slot1))
                Image("fruit" + String(slot2))
                Image("fruit" + String(slot3))
            }.scaleEffect(0.75)
            
            
            Spacer()
            
            Button("Spin"){
                
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                if (slot1 == slot2 && slot2 == slot3) {
                    credits += 1000
                }
                else {
                    credits -= 5
                }
            }
            .padding()
            // Then adjust the left and right padding to be bigger
            .padding([.leading, .trailing], 40)
            .foregroundColor(.white)
            .background(Color(.systemPink))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default))
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
