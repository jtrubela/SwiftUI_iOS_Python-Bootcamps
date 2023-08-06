//
//  ContentView.swift
//  GuessTheFlag
//
// Create a Guess That Flag guessing game that allows the user to choose a flag given a country.
// each flag(10 int total) will be shuffled at random
// a random generated number from 0 - 2(amount of flags shown) will be given
// we would need to check the users choice against the given flags
// if it is correct increase the users score
// if it is wrong, relay an alert back to the user
//
//  Created by Justin Trubela on 12/17/21. Updated to include animations 1/4/22
//

import SwiftUI

struct FlagImage: View {
    var ImageText: String
    
    var body: some View {
        Image(ImageText)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 50)
    }
}


struct ContentView: View {
// Data properties
    @State private var countries = ["Estonia","US","Spain","Germany","France","Ireland","Poland","Russia","UK","Italy"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var correctResponses = ["Superb","Fantastic","Correct","You're good at this","Nice! You should do this for a living"].shuffled()
    @State private var wrongResponses = ["Incorrect. Try again","You had a 33% chance of guessing right and you didn't","Nope"].shuffled()
    
// Game view properties
    @State private var showingScore = false
    @State private var gameOver = false
    
// Alert Title properties
    @State private var scoreTitle = ""
    
// Game properties
    @State private var questionCount = 0
    @State private var oldQCount = 0
    @State private var score = 0
    @State private var oldScore = 0
    
// Animation properties
    //Flag 1
    @State private var animationAmountFlag1 = 0.0
    @State private var flag1_Opacity = 1.0
    @State private var flag1_Scale = 1.0
    //Flag 2
    @State private var animationAmountFlag2 = 0.0
    @State private var flag2_Opacity = 1.0
    @State private var flag2_Scale = 1.0
    //Flag 3
    @State private var animationAmountFlag3 = 0.0
    @State private var flag3_Opacity = 1.0
    @State private var flag3_Scale = 1.0
    
    
    let MAX_QUESTIONS = 8
    
    
    var body: some View {
        
        ZStack {
// SET BACKGROUND
            RadialGradient(stops: [
                .init(color: Color(red: 0.0 , green: 0.9, blue: 0.0) , location: 0.3),
                .init(color: .white, location: 0.7),
            ],center: .top, startRadius: 100, endRadius: 400)
                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: .black , location: 0.3),
                .init(color: .secondary, location: 0.8),
            ],   center: .bottom, startRadius: 80, endRadius: 600)
                .ignoresSafeArea()
            
//When Game is active
            
            if !gameOver {
                VStack{
//Game TITLE
                    Text("Guess the Flag")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    
//GAME CARD
                    VStack(spacing: 5){
    //GAME CARD TITLE
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .italic().bold()
                        Text(countries[correctAnswer]).font(.title).bold()
                        Spacer()
                        
    //FLAG 1
                        VStack {
                            Button(){
                                // if the flag tapped update animation values and show the animation
                                if flagTapped(0){
                                    withAnimation{
                                        animationAmountFlag1 += 360
                                        //Set flag opacity
                                        flag1_Opacity = 1.0     // Correct answer full opacity
                                        flag2_Opacity = 0.25    // incorrect at 25% opacity
                                        flag3_Opacity = 0.25    // incorrect at 25% opacity
                                        //Set flag scale
                                        flag1_Scale = 1.3       // Correct answer scale up 130%
                                        flag2_Scale = 0.5       // incorrect scale down to 50%
                                        flag3_Scale = 0.5       // incorrect scale down to 50%
                                    }
                                }
                            } label: { FlagImage(ImageText: countries[0]) }
                        }
/*animate Flag1*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag1)
                            .rotation3DEffect(.degrees(animationAmountFlag1), axis: (x:0.0,y:1.0,z:0.0)
                        )
/*animate Flag2*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag2)
                            .rotation3DEffect(.degrees(animationAmountFlag2), axis: (x:1.0,y:0.0,z:0.0)
                        )
/*animate Flag3*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag3)
                            .rotation3DEffect(.degrees(animationAmountFlag3), axis: (x:1.0,y:0.0,z:0.0)
                        )
                        .opacity(flag1_Opacity)
                        .scaleEffect(flag1_Scale)
                        
    //FLAG 2
                        VStack {
                            Button(){
                                // if the flag tapped update animation values and show the animation
                                if flagTapped(1){
                                    withAnimation{
                                        animationAmountFlag2 += 360
                                        //Set flag opacity
                                        flag1_Opacity = 0.25    // incorrect at 25% opacity
                                        flag2_Opacity = 1.0     // Correct answer full opacity
                                        flag3_Opacity = 0.25    // incorrect at 25% opacity

                                        //Set flag scale
                                        flag1_Scale = 0.5       // incorrect scale down to 50%
                                        flag2_Scale = 1.3       // Correct answer scale up 130%
                                        flag3_Scale = 0.5       // incorrect scale down to 50%
                                    }
                                }
                            } label: {FlagImage(ImageText: countries[1])}
                        }
/*animate Flag1*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag1)
                            .rotation3DEffect(.degrees(animationAmountFlag1), axis: (x:1.0,y:0.0,z:0.0)
                        )
/*animate Flag2*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag2)
                            .rotation3DEffect(.degrees(animationAmountFlag2), axis: (x:0.0,y:1.0,z:0.0)
                        )
/*animate Flag3*/       .animation(
                            .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag3)
                            .rotation3DEffect(.degrees(animationAmountFlag3), axis: (x:1.0,y:0.0,z:0.0)
                        )
                        .opacity(flag2_Opacity)
                        .scaleEffect(flag2_Scale)
                        .padding()
                        
//FLAG 3
                        VStack {
                            Button(){
                                // if the flag tapped update animation values and show the animation
                                if flagTapped(2){
                                    withAnimation{
                                        animationAmountFlag3 += 360
                                        //Set flag opacity
                                        flag1_Opacity = 0.25    // incorrect at 25% opacity
                                        flag2_Opacity = 0.25    // incorrect at 25% opacity
                                        flag3_Opacity = 1.0     // Correct answer full opacity
                                        //Set flag scale
                                        flag1_Scale = 0.5       // incorrect scale down to 50%
                                        flag2_Scale = 0.5       // incorrect scale down to 50%
                                        flag3_Scale = 1.3       // Correct answer scale up 130%
                                    }
                                }
                            } label: {
                                FlagImage(ImageText: countries[2])
                            }
                        }
/*animate Flag1*/           .animation(
                                .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag1)
                                .rotation3DEffect(.degrees(animationAmountFlag1), axis: (x:1.0,y:0.0,z:0.0)
                            )
                        
/*animate Flag2*/           .animation(
                                .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag2)
                                .rotation3DEffect(.degrees(animationAmountFlag2), axis: (x:1.0,y:0.0,z:0.0)
                            )
                        
/*animate Flag3*/           .animation(
                                .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmountFlag3)
                                .rotation3DEffect(.degrees(animationAmountFlag3), axis: (x:0.0,y:1.0,z:0.0)
                            )
                            .opacity(flag3_Opacity)
                            .scaleEffect(flag3_Scale)
                        
                    }
                    // Game Card modifiers
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    //BOTTOM STACK Vstack for score
                    Spacer()
                    VStack {
                        Text("Score: \(score)").font(.title).foregroundColor(.white).bold().padding()
                    }
                    Spacer()
                }.padding(50)
                
//End Game View
                
            }
            
//Start End Gameover View
            
            //If the number of questions given exceeds the maxQuestions show end game result view
            else{
                VStack{
                    VStack{
                        Text("Final score is: \(oldScore)/\(oldQCount)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Button("Play Again"){
                            gameOver = false
                            askQuestion()
                        }.buttonStyle(.borderedProminent).font(.title2).cornerRadius(20).padding()
                    }
                }
            }
        }
        //alert user
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)/\(questionCount)")
        }
    }
    
    // When a flag is tapped determine if its right or wrong
    func flagTapped(_ number: Int) -> Bool {
        questionCount += 1
        // if correct flag is tapped set the alert title to a correct response and set the alert view to true and add 1 to the score
        if number == correctAnswer{
            scoreTitle = "\(correctResponses[0])"
            score+=1
            showingScore = true
            return true
        // otherwise set alert title toa incorrect response and set the alert view to true
        } else {
            scoreTitle = "\(wrongResponses[0])\nYou clicked on \(countries[number])'s flag"
            showingScore = true
            return false
        }
    }
    
    // Ask whats the flag question
    func askQuestion() {
        // reset all animation values back to its original state
        resetAnimationValues()
        // if the number of questions asked is at the max, update the score to present to user restart the game
        if questionCount > MAX_QUESTIONS-1{
            updateScore()
            restartGame()
        // otherwise shuffle the arrays for new values and pick another random number as correct answer
        } else {
            shuffleUp()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    //Shuffles array values
    func shuffleUp(){
        countries.shuffle()
        correctResponses.shuffle()
        wrongResponses.shuffle()
    }
    
    //Save game score to show user at end
    func updateScore(){
        oldScore = score
        oldQCount = questionCount
    }
    
    //Restart the game
    func restartGame() {
        score = 0
        questionCount = 1
        gameOver = true
    }
    
    //Reset animation values
    func resetAnimationValues(){
        animationAmountFlag1 = 0.0
        animationAmountFlag2 = 0.0
        animationAmountFlag3 = 0.0
        flag1_Opacity = 1.0
        flag2_Opacity = 1.0
        flag3_Opacity = 1.0
        flag1_Scale = 1.0
        flag2_Scale = 1.0
        flag3_Scale = 1.0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
    }
}
