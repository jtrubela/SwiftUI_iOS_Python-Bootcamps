//
//  MenuView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/5/22.
//

import SwiftUI

struct MenuView: View {
    var numberOfQuestions = [5,10,20]
    @State private var numQuestions = 5
    @State private var selectedNumber = 0
    @State private var numChosen: Double = 2
    @State private var menuView = true
    
    @State private var animals = ["bear", "buffalo", "chick", "chicken","cow", "crocodile", "dog",
                                  "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo",
                                  "horse", "monkey", "monkey", "moose", "narwhal", "owl", "panda",
                                  "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake",
                                  "walrus", "whale", "zebra"].shuffled()
    @State private var spinAnimation = 0.0
    
    var body: some View {
        if menuView {
            NavigationView{
                ZStack{
                Color.yellow.ignoresSafeArea()
                VStack {
                    VStack {
                        Button(){
                        } label: {
                            Image("\(animals[20])")
                                .padding()
                                .shadow(color: .black, radius: 5, x: 2, y: 2)
                                .animation(
                                    .interactiveSpring()
                                        .speed(0.5),value: spinAnimation)
                        }
                    }
                    .animation(.interpolatingSpring(stiffness: 2, damping: 10), value: spinAnimation)
                    .rotation3DEffect(.degrees(spinAnimation), axis: (x:2,y:1,z:0))
                    VStack{
                        Text("Pick a number to multiply by")
                            .font(.headline)
                        HStack{
                            //Minus Sign
                            Button(){
                                if numChosen == 2{
                                    numChosen = numChosen
                                    selectedNumber = Int(numChosen)
                                }
                                else{
                                    numChosen -= 1
                                    selectedNumber = Int(numChosen)
                                    spinAnimation -= 180
                                }
                                numChosen = Double(selectedNumber)
                            } label: {
                                Text("\(Image(systemName: "minus"))")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                    .bold()
                            }
                            
                            Slider(value: $numChosen, in: 2...12, step: 1){
                                minimumScaleFactor(2)
                            }
                            //Plus Sign
                            Button(){
                                if numChosen == 12{
                                    numChosen = numChosen
                                }
                                else{
                                    numChosen += 1
                                    spinAnimation -= 180
                                }
                            } label: {
                                Text("\(Image(systemName: "plus"))")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                    .bold()
                            }
                        }
                        .padding()
                        .accentColor(Color.blue)
                    }.addBoxOverlay()
                    
                    
                    Text("\(Int(numChosen))")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 320, height: 50, alignment: .center)
                    
                    VStack {
                        Button(){
                        } label: {
                            Image("\(animals[10])")
                                .padding()
                                .shadow(color: .black, radius: 5, x: 2, y: 2)
                                .animation(
                                    .interactiveSpring()
                                        .speed(0.5), value: spinAnimation)
                        }
                    }
                    .rotation3DEffect(.degrees(spinAnimation), axis: (x:1,y:2,z:0))

                    VStack {
                        Text("Pick how many questions you want")
                        Picker("How many questions", selection: $numQuestions){
                            ForEach(numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                    .addBoxOverlay()
                    
                    Spacer()

                }
                .padding(30)
                .navigationBarTitle("Times Tables")
            }.toolbar{
                Button("Play", action: playGame)
            }
        }
            NavigationLink(destination: ContentView(
                numQuestions: self.numQuestions,
                numChosen: Int(self.numChosen))){}
        }
        else {
                ContentView(numQuestions: numQuestions, numChosen: Int(numChosen))
        }
    }
    
    func playGame() {
        menuView.toggle()
    }
}

struct boxOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color.black)
            )
    }
}
extension View {
    func addBoxOverlay() -> some View {
        modifier(boxOverlay())
    }
}

//struct ContentViewsss_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
//
