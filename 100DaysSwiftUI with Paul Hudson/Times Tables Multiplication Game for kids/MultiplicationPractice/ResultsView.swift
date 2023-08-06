//
//  ResultsView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/8/22.
//

import SwiftUI

struct ResultsView: View {
    @State private var resultsView = true
    @State public var score: Int
    @State public var questionCount: Int
    @State private var spinAnimationAmount = 0.0
    
    var body: some View {
        if resultsView {
            NavigationView{
                ZStack{
                    LinearGradient(colors: [.yellow,.yellow,.white,.white],
                                   startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    ZStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 100, alignment: .center)
                                Text("Score: \(score)/\(questionCount)")
                                    .font(.title)
                                    .foregroundColor(.green)
                            }
                            VStack(spacing: 20){
                                VStack{
                                    Image("monkey").padding(30)
                                        .animation(
                                            .interactiveSpring()
                                                .repeatForever(),
                                            value: spinAnimationAmount)
                                }
                                Text("That was FUN!").font(.headline)
                                Text("Practice makes perfect!")
                                Text("Keep up the good work and try all \n           the different numbers!")
                                
                            Spacer()
                                Image("animals")
                            }

                    }.navigationTitle("Results")
                }.toolbar{
                    Button("Play Again", action: restartGame)
                }
                NavigationLink("Times Tables By Justin Trubela",destination: MenuView())
            }
        }else{
            MenuView()
        }
        
    }
    func restartGame(){
        resultsView.toggle()
    }
}
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ResultsView(score: 5, questionCount: 5)
//        }
//    }
