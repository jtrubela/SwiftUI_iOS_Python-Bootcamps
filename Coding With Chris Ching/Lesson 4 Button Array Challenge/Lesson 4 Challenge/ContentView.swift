//
//  ContentView.swift
//  Lesson 4 Challenge
//
//  Created by Justin Trubela on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    @State var array = [Int]()
    
    var body: some View {

            VStack {
                NavigationView{
                    List(array, id: \.self){ arrayElement in

                                Text(String(arrayElement))
                                }
                }
                
                
                Button("Button 1"){

                    let randInt = Int.random(in: 1...10)
                    
//                    if randInt != 7{array.append(String(randInt))}
                    
                    
                }
                .frame(width: 250, height: 50, alignment: .center)
                .background(Color.black)
                .foregroundColor(.white)
                .font(.title2)
                .cornerRadius(30)
                .padding()
                
                Button("Button 2"){
                    
                    //var intArray = [Int]()
                    
//                    for element in 0...array.count-1 {
//
//                    }
                    
                }.frame(width: 250, height: 50, alignment: .center)
                .background(Color.black)
                .foregroundColor(.white)
                .font(.title2)
                .cornerRadius(30)
                .padding()
                
                
                Button("Button 3"){
                    
                    
                    
                }.frame(width: 250, height: 50, alignment: .center)
                .background(Color.black)
                .foregroundColor(.white)
                .font(.title2)
                .cornerRadius(30)
                .padding()

        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

}
