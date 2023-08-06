//
//  ContentView.swift
//  Word Scramble
//
//  Created by Justin Trubela on 12/28/21.
//
// Learned:
//          Remember to initialize empty arrays with [String]()<---
//          .autocapitalization(.none)->(.words)->(.allCharacters)->(.sentences)
//          id:\.self does not work well when values are similar
//          SF SYMBOL syntax   ->   systemName: "\().circle.fill"
//          need to review if let/guard let
//          .lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//          .insert(variable, at: index)
//          .onSubmit(action ->)        on user pressing enter do something
//          WithAnimation {     code    }
//          FatalError - immediately crash our code
//          loading in file
//              if let variablefileURL = bundle.main.url(for resourse: file name, extension: txt) {
//                  if let variableContainingFile = try? String(contentsOf: variableFileURL) {
//                  //unwrap the file into a string
//                      do the code }
//          More practice with UITextChecker
//

import SwiftUI

struct ContentView: View {
    //Word Variables
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    //Alert Variables
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var isAlert = false
    
    //Scoring Variables
    @State private var ratings = ["Average", "Educated", "Wordsmith"]
    @State private var rating = ""
    @State private var fourLetterWords = 0
    @State private var fiveLetterWords = 0
    @State private var sixLetterWords = 0
    @State private var sevenLetterWords = 0
    @State private var numberOfValidWords = 0
    

    var body: some View {
            NavigationView{
                List{
                    Section{
                        HStack{
                            Image(systemName: "4.circle.fill")
                            Text("\(fourLetterWords)       ")
                            Image(systemName: "5.circle.fill")
                            Text("\(fiveLetterWords)       ")
                            Image(systemName: "6.circle.fill")
                            Text("\(sixLetterWords)       ")
                            Image(systemName: "7.circle.fill")
                            Text("\(sevenLetterWords)")
                        }
                        .font(.title3)
                        
                        HStack{
                            Text("Valid Words: \(numberOfValidWords)       ").bold()
                            Text("Rating: \(rating)").bold()
                        }
                    }
                    
                    Section {
                        TextField("Enter your word", text: $newWord).autocapitalization(.none)
                    }
                    
                    Section{
                        ForEach(usedWords, id:\.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle.fill")
                                Text(word)
                            }
                        }
                    }
                    
                }.navigationTitle(rootWord).font(.callout)
                    .toolbar{
                        Button("New Word", action: startGame)
                    }
                    .onSubmit(addNewWord)
                    .onAppear(perform: startGame)
                    .alert(errorTitle, isPresented: $isAlert){
                        Button("OK", role:.cancel) {
                        }
                    } message: {
                        Text(errorMessage)
                    }
            }
    }
    
    //Define a function to gather information to determine an error
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        isAlert = true
    }
    //Define a function to utilize when new word is entered
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else{return}
        
        //Extra Validation
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make up words, you know!")
            return
        }
        guard isSmall(word: answer) else {
            wordError(title: "Word too small to be awarded points", message: "Try to expand your vocabulary")
            return
        }
        guard isRootWord(word: answer) else {
            wordError(title: "Word is same as root word", message: "Nice try")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
            scoreWord()
        }
        newWord = ""
    }
    //Define a set of rules to which words get awarded points
    func scoreWord() {
        if newWord.count == 4 {
            fourLetterWords += 1
            numberOfValidWords += 1
        }
        else if newWord.count == 5 {
            fiveLetterWords += 1
            numberOfValidWords += 1
        }
        else if newWord.count == 6 {
            sixLetterWords += 1
            numberOfValidWords += 1
        }
        else if newWord.count == 7 {
            sevenLetterWords += 1
            numberOfValidWords += 1
        }
        getRating(fourLW: fourLetterWords, fiveLW: fiveLetterWords, sixLW: sixLetterWords, sevLW: sevenLetterWords)
    }
    //Define a game rating to rate player on words given
    func getRating(fourLW: Int, fiveLW: Int, sixLW: Int, sevLW: Int) {
        if sevLW >= 1 && sixLW >= 1 || numberOfValidWords >= 7{
            rating = ratings[2]
        }
        else if fiveLW >= 2 && fourLW >= 2 {
            rating = ratings[1]
        }
        else if fiveLW < 1 && fourLW >= 1 {
            rating = ratings[0]
        }
    }
    //Define a function that imports data and turns into a useable variable
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                reset()
                return
            }
        }
        //if you couldnt find anything
        fatalError("Could not load start.txt from bundle")
    }
    //Determines if user re-enters the same word
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    //Determines if the word is too small to be awarded points
    func isSmall(word: String) -> Bool {
        if newWord.count <= 3{
            return false
        }
        else {return true}
    }
    //Determines if the word entered is the rootword
    func isRootWord(word: String) -> Bool {
        if newWord == rootWord{return false}
        return true
    }
    //Determines if the word is possible given the letters in the root word
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }
            else{
                return false
            }
        }
        return true
    }
    //Determines if the word is Real using system dictionary
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    //Reset all values for each word
    func reset(){
        fourLetterWords = 0
        fiveLetterWords = 0
        sixLetterWords = 0
        sevenLetterWords = 0
        rating = ""
        numberOfValidWords = 0
        usedWords.removeAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
