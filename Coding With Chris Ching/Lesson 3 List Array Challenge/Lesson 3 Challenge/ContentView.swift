//
//  ContentView.swift
//  Lesson 3 Challenge
//
//  Created by Justin Trubela on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var array = ["Something", "Some other thing", "Another random thing","One more random thing","The last random thing"]
    
    @State var listArray = [String]()
    
    var body: some View {

            VStack {
                NavigationView{
                    List(listArray, id: \.self){ arrayElement in
                        NavigationLink(
                    
                            destination: Text("Destination"),
                            label: {
                                Text(arrayElement)
                                })
                
                    }.navigationBarTitle(Text("My List"))
                

                }
                
                Button("Randomize"){
                    
                    let randString = Int.random(in: 0...4)
                    
                    listArray.append(array[randString])
                
                }
                .MakeRandomizerButton()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*Button -
 Dim: 250x50
 BGColor:Black
 FGColor: white
  FONT:title2
 CRadius:30
 */
struct RandomizeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 50, alignment: .center)
            .background(Color.black)
            .foregroundColor(.white)
            .font(.title2)
            .cornerRadius(30)
    }
}
extension View {
    func MakeRandomizerButton() -> some View {
        modifier(RandomizeButton())
    }
}
