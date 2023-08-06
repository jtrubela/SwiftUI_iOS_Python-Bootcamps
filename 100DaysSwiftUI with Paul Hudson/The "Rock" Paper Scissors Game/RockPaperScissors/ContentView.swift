//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Justin Trubela on 12/25/21.
//

import SwiftUI

struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 350)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
    }
}
extension View {
    func MakeRoundedSquareBackground() -> some View {
        modifier(SquareBackground())
    }
}


struct ContentView: View {
    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var gameChoice = ["Win", "Lose"].shuffled()
    @State private var results = ""
    
    @State private var playerScore = 0
    @State private var oldPlayerScore = 0
    @State private var computerScore = 0
    @State private var oldComputerScore = 0
    @State private var questionCount = 1
    @State private var numberOfDraws = 0
    @State private var oldNumberOfDraws = 0
    
    @State private var gameComplete = false
    
    @State private var alert = false
    @State private var alertTitle = ""
    
    @State private var playerSelection = ""
    @State private var computerSelection = ""
    
    var maxQuestions = 10
    var getRandomChoice = Int.random(in: 0...2)
    var getRandomObjective = Int.random(in: 0...1)
    
    private var correctAnswer: String {
        choices[getRandomChoice]
    }
    private var winOrLose: String {
        gameChoice[getRandomObjective]
    }
    
    func askQuestion() {
        if questionCount <= 10 {
            choices.shuffle()
            gameChoice.shuffle()
            gameComplete = false
        }
        else{
            gameComplete = true
            restartGame()
        }
    }
    
    func restartGame(){
        questionCount = 1
        oldPlayerScore = playerScore
        playerScore = 0
        oldComputerScore = computerScore
        computerScore = 0
        oldNumberOfDraws = numberOfDraws
        numberOfDraws = 0
        
    }
    
    func WhoWins(){
        //PLAYER - ROCK
        if playerSelection == "Rock" && computerSelection == "Rock"
            || playerSelection == "Paper" && computerSelection == "Paper"
            || playerSelection == "Scissors" && computerSelection == "Scissors"{
            numberOfDraws += 1
        }
        
        //PLAYER - ROCK
        if playerSelection == "Rock" && computerSelection == "Paper" && winOrLose == "Win"{
            computerScore += 1
        }
        //PLAYER - ROCK
        if playerSelection == "Rock" && computerSelection == "Paper" && winOrLose == "Lose"{
            playerScore += 1
        }
        
        //PLAYER - ROCK
        if playerSelection == "Rock" && computerSelection == "Scissors" && winOrLose == "Win" {
            playerScore += 1
        }
        //PLAYER - ROCK
        if playerSelection == "Rock" && computerSelection == "Scissors" && winOrLose == "Lose" {
            computerScore += 1
        }
        
        
        
        //PLAYER - PAPER
        if playerSelection == "Paper" && computerSelection == "Rock" && winOrLose == "Win" {
            playerScore += 1
        }
        //PLAYER - PAPER
        if playerSelection == "Paper" && computerSelection == "Rock" && winOrLose == "Lose" {
            computerScore += 1
        }
        
        //PLAYER - PAPER
        if playerSelection == "Paper" && computerSelection == "Scissors" && winOrLose == "Win" {
            computerScore += 1
        }
        //PLAYER - PAPER
        if playerSelection == "Paper" && computerSelection == "Scissors" && winOrLose == "Lose" {
            playerScore += 1
        }
        
        
        //PLAYER - SCISSORS
        if playerSelection == "Scissors" && computerSelection == "Rock" && winOrLose == "Win"{
            computerScore += 1
        }
        //PLAYER - SCISSORS
        if playerSelection == "Scissors" && computerSelection == "Rock" && winOrLose == "Lose"{
            playerScore += 1
        }
        
        //PLAYER - SCISSORS
        if playerSelection == "Scissors" && computerSelection == "Paper" && winOrLose == "Win"{
            playerScore += 1
        }
        //PLAYER - SCISSORS
        if playerSelection == "Scissors" && computerSelection == "Paper" && winOrLose == "Lose"{
            computerScore += 1
        }
        
    }
    
    
    var body: some View {
        
        ZStack {
            if !gameComplete {
                ZStack {
                    Color.red.ignoresSafeArea()
                    
                    VStack(spacing: 20){
                        Spacer()
                        Text("Rock Paper Scissors").font(.largeTitle.bold())
                        Spacer()
                        Spacer()
                        Section {
                            Image("\(correctAnswer)")
                                .resizable()
                                .frame(width: 250, height: 250, alignment: .center)
                        } header: {
                            Text("Computer chose:   \(correctAnswer)").font(.title2).bold()
                        }
                        Spacer()
                        
                        HStack(spacing: 40){
                            VStack {
                                Section {
                                    Text("Objective: \(gameChoice[0])").font(.title)
                                    HStack(spacing: 40){
                                        Button(){
                                            playerSelection = "Rock"
                                            computerSelection = correctAnswer
                                            questionCount += 1
                                            
                                            WhoWins()
                                            askQuestion()
                                        } label: {
                                            Image("Rock")
                                        }.padding(5)
                                        
                                        Button(){
                                            playerSelection = "Paper"
                                            computerSelection = correctAnswer
                                            questionCount += 1
                                            
                                            WhoWins()
                                            askQuestion()
                                        } label: {
                                            Image("Paper")
                                        }
                                        
                                        Button(){
                                            playerSelection = "Scissors"
                                            computerSelection = correctAnswer
                                            questionCount += 1
                                            
                                            WhoWins()
                                            askQuestion()
                                        } label: {
                                            Image("Scissors")
                                        }
                                    }.padding(5)
                                    
                                    HStack(spacing: 60){
                                        HStack {
                                            Text("    Rock")
                                        }
                                        HStack {
                                            Text("     Paper")
                                        }
                                        HStack {
                                            Text("Scissors")
                                        }
                                    }.font(.title3.bold().weight(.semibold))
                                }
                            }
                        }
                        .shadow(radius: 10)
                        .background(.white)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                        
                        HStack {
                            Spacer()
                            Text("Player: \(playerScore)")
                            Spacer()
                            Text("CPU: \(computerScore)")
                            Spacer()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Spacer()
                        }.font(.title).background(.white)                                .clipShape(RoundedRectangle(cornerRadius: 10)).padding()
                        Spacer()
                        
                    }
                }
                
            }
            else if gameComplete {
                ZStack{
                    Color.green.ignoresSafeArea()
                    Spacer()
                    VStack{
                        Text("\(results)").foregroundColor(.black)
                        
                        Spacer()
                        VStack{
                            Spacer()
                            Text("Player: \(oldPlayerScore)")
                            Spacer()
                            Text("Draws: \(oldNumberOfDraws)")
                            Spacer()
                            Text("CPU: \(oldComputerScore)")
                            Spacer()
                            
                        }
                        Text("\n\(oldPlayerScore) / \(maxQuestions)")
                        Spacer()
                        Button("Play Again"){
                            gameComplete = false
                        }.buttonStyle(.borderedProminent)
                            .font(.title)
                            .shadow(radius: 10)
                            .padding()
                        
                        Spacer()
                    }
                    .font(.largeTitle)
                    .MakeRoundedSquareBackground()
                    .padding(30)
                    
                    
                }.navigationTitle("Game Over")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
