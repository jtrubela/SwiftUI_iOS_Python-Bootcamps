//
//  ContentView.swift
//  Lesson 2 Arrays Challenge
//
//  Created by Justin Trubela on 7/14/21.
//

/*
 Set up

 Create a brand new SwiftUI app Xcode project.



 Challenge

 Build a UI with a label and two buttons below it, side by side.

 Create a new structure to represent a playing card

 It should keep track of a number from 1 to 13 (representing Ace to King)
 It should also keep track of the suit (Spades, Clubs, Hearts, Diamonds)
 Declare a "deck" property in your ContentView.swift that will be used to store many instances of this structure

 When the first button is tapped:

 Create an instance of your playing card structure and assign it a random number and suit.
 If this number and suit combination has been generated already, change the label to say: "Generated duplicate card."
 If the number/suit combination is new, then store this instance in your deck property and change the label to say, "Generated a ____ of ____" where the first blank is the number and second blank is the suit.
 Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 Example: "Generated a King of Clubs"
 When the second button is tapped:

 Randomly select an instance from your deck property
 Change the label to say "Drew a ____ of ____" where the first blank is the number and second blank is the suit.
 Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 Example: "Drew a King of Clubs"
 If this button is tapped when there are no cards in the deck, display the message: "No cards in the deck."


 I've purposely given less direct instructions in this challenge to allow you more room to think!

 If you get stuck, please see the hints below.

 Don't get discouraged if you can't complete this challenge. It's a definitely on the tougher side. However, attempting it and then seeing the solution, will definitely help you grow!

 .

 .


 Hints:

 If you're having trouble checking whether or not a generated card has been seen before, there are multiple ways to go about it:

 You can create a separate array to store a string representation of the number/suit combo. Then use the contains method to check that array.
 Or if you want to use the contains method on your deck array and check if a particular card instance is already in there, you can add a protocol to make your Card structure equatable. Simply declare your Card instance like this: "struct Card: Equatable".


 If you're having trouble getting the string representations of the suits and card numbers, you can create a function that accepts an Int and returns a string. Use an If statement and check the number and return the string representation (such as "Ace")



 Lastly, you can check out the solution project to get some ideas and then try to implement it yourself afterwards!
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
