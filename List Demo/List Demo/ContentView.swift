//
//  ContentView.swift
//  List Demo
//
//  Created by Justin Trubela on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var array = ["Element 1","Element 2","Element 3","Element 4","Element 5"]
    
    var body: some View {

        
        NavigationView{
            
            List(array, id: \.self){ arrayElement in 
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text(arrayElement)
                    })
                
            }.navigationBarTitle(Text("My List"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
