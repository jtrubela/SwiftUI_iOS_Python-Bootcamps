//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Justin Trubela on 12/22/21.
//

import SwiftUI


struct MakeTitleBlue: ViewModifier {

    func body(content: Content) -> some View{
            content
            .font(.largeTitle.weight(.heavy))
                .foregroundColor(.blue)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func BlueTitle(){
        modifier(MakeTitleBlue())
    }
}


//***********************************************************
//                  CUSTOM CONTAINERS
//***********************************************************

struct GridStack<Content: View> : View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack{
            ForEach(0...rows, id: \.self) { row in
                HStack{
                    ForEach(0..<columns, id: \.self){ column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack {
                Text("GRIDSTACK").modifier(MakeTitleBlue())
                GridStack(rows: 4, columns: 4) { row, col in
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//***********************************************************
//          Using the full width and height of the screen
//***********************************************************
//        Text("Hello, world!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
//***********************************************************


//***********************************************************
//          Shows exactly how swift implements views
//***********************************************************
//Button("Hello, world!") {
//    print(type(of: self.body))
//.background(.red)
//.frame(width: 200, height: 200)
//}
//                              OUTPUT
//    //ModifiedContent
//        //<ModifiedContent
//            //<Button<Text>
//                //, _BackgroundStyleModifier<Color>>,
//    //_FrameLayout>
//}
//***********************************************************


//***********************************************************
//          modifier placement matters
//***********************************************************
//Button("Hello, world!") {
//    // do nothing
//}
                                    // SHOWS JUST THE TEXT WITH RED BACKGROUND
//.background(.red)
//.frame(width: 200, height: 200)

//Button("Hello, world!") {
//    // do nothing
//}
                                    // SHOWS THE FRAME GIVEN WITH RED BACKGROUND
//.frame(width: 200, height: 200)
//.background(.red)
//***********************************************************



//***********************************************************
//            OVERLAYED PADDING WITH DIFFERENT COLORS
//***********************************************************
//Text("Hello, world!")
//    .padding()
//    .background(.red)
//    .padding()
//    .background(.blue)
//    .padding()
//    .background(.green)
//    .padding()
//    .background(.yellow)
//***********************************************************



//***********************************************************
//      CONDITIONAL MODIFIERS USING TERNARY OPERATORS
//***********************************************************
//
//@State private var useRedText = false
//
//var body: some View {
//
//    Button("Hello, world!") {
//        useRedText.toggle()
//    }
//    .foregroundColor(useRedText ? .red : .blue)
//}
//
//
//            IS THE SAME AS BUT MORE WORK IS USED
//
//
//  if useRedText {
//      Button("Hello, world!") {
//           useRedText.toggle()
//      }.foregroundColor(.red)
//  } else {
//      Button("Hello, world!") {
//           useRedText.toggle()
//      }.foregroundColor(.blue)
//    .foregroundColor(useRedText ? .red : .blue)
//}
//***********************************************************


//***********************************************************
//      ENVIRONMENT MODIFIERS
//  modifies all items in the section/stack/group
//***********************************************************
//
//VStack {
//    Text("Gryffindor")
//    Text("Hufflepuff")
//    Text("Ravenclaw")
//    Text("Slytherin")
//}
//.font(.title)
//***********************************************************


//***********************************************************
//              VIEWS AS PROPERTIES
//***********************************************************
// Creating views as properties can be helpful to keep your body code clearer
//  – not only does it help avoid repetition, but it can also get more
//    complex code out of the body property.
//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("nunquam titillandus")
//    var body: some View {
//
//        VStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//        }
//        .font(.title)
//    }
//}
//
//***********************************************************

//***********************************************************
//              VIEWS AS PROPERTIES
//
//Swift doesn’t let us create one stored property that refers
//  to other stored properties, because it would cause problems
//  when the object is created. This means trying to create a
//  TextField bound to a local property will cause problems.
//
//However, you can create computed properties if you want
//
//***********************************************************

//var motto1: some View {
//    Text("Draco dormiens")
//        .foregroundColor(.red)
//}
//var motto2: some View {
//    Text("nunquam titillandus")
//        .foregroundColor(.blue)
//}
//
//var spells: some View {
//    VStack{
//        motto1
//        motto2
//    }
//}
//
//@ViewBuilder var spells2: some View {
//    VStack{
//        Text("Lumos")
//        Text("Obliviate")
//    }.font(.title)
//}
//
//var body: some View {
//    spells2
//}
//
//***********************************************************


//***********************************************************
//                  VIEW COMPOSITION
//     Breaking down larger views into smaller views
//***********************************************************
//struct CapsuleText: View {
//    var text: String        //takes in some text
//
//    var body: some View {
//        Text(text)          //uses that text in some Text and applies modifiers to it
//            .font(.largeTitle)
//            .padding()
//            .foregroundColor(.white)
//            .background(.blue)
//            .clipShape(Capsule())
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            CapsuleText(text: "String1")      //Implementation of said view modifier
//            CapsuleText(text: "String2")
//        }
//    }
//}
//***********************************************************

//***********************************************************
//                  CUSTOM MODIFIERS
//***********************************************************
//
//struct Watermark: ViewModifier {
//    var text: String
//    func body(content: Content) -> some View {
//        ZStack (alignment: .bottomTrailing){
//            content
//
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(.black)
//
//        }
//    }
//}
//extension View {
//    func watermarked(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}
//
//struct Title: ViewModifier {
//
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ZStack{
//            Color.blue
//                .frame(width:300, height: 200)
//                .watermarked(with: "Hacking With Swift")
//            VStack{
//                Text("Justin learned swift").foregroundColor(.black)
//            }
//        }
//    }
//}
//***********************************************************


//***********************************************************
//                  CUSTOM CONTAINERS
//***********************************************************

//struct GridStack<Content: View> : View {
//    let rows: Int
//    let columns: Int
//    let content: (Int, Int) -> Content
//
//    var body: some View {
//        VStack{
//            ForEach(0...rows, id: \.self) { row in
//                HStack{
//                    ForEach(0..<columns, id: \.self){ column in
//                        content(row, column)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        GridStack(rows: 4, columns: 4) { row, col in
//            VStack{
//                Image(systemName: "\(row * 4 + col).circle")
//                    .padding()
//                //Text("R\(row) C\(col)")
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
