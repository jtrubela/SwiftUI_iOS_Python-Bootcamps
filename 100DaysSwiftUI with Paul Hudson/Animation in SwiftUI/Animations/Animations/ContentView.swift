//
//  ContentView.swift
//  Animations
//
//  Created by Justin Trubela on 1/1/22.
//

//  .clipShape(Circle())
//  decimal values in state propertys are given in percentages
//  .animation(.scaleEffect, value: variable)
//  .animation(.easeOut/easeOut, value: variable)     //way it moves around the screen start fast/slow and slow/fast to stop
//  .animation(.easeInOut(duration: seconds), value: int) // has more modifiers
//.repeatCount(2, autoreverses: Bool) //becarful of your repeat count because it needs to match your state value
//.repeatForever(autoreverses: Bool)
//.delay(int, autoreverses: Bool)
//  .blur(radius: ...)
//  .animation(.interpolatingSpring(stiffness: int, damping: int, initialVelocity: int), value: variable)
//  .animation(.spring, value: variable)

//  When you apply an overlay to a view, the original view continues to provide the layout characteristics for the resulting view. In the following example, the heart image is shown overlaid in front of, and aligned to the bottom of the folder image.

//BINDING ANIMATIONS     $animationAmount.animation()
//ORDER OF ANIMATIONS MATTER     --   each animation controls the modifiers above it

//background.....\/
//.animation(.default, value: enabled)      ->subtle change<-       .animation(nil, value: enabled)
// animate color change when you want it to makes it easier to distinguish elsewhere


//ANIMATING GESTURES
//tap gestures
//drag gestures
//.onChanged { dragAmount = $0.translation }
//.onEnded { _ in dragAmount = .zero }

//Transitions handle the way things move in to the screens view
//.transition(.scale)
//if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//     ->>>>>         .transition(.asymmetric(insertion: .scale, removal: .opacity))

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
@State private var isShowingRed = false

    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .transition(.pivot)
            }
        }.onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//IMPLICIT ANIMATION
//Button("Tap Me"){
//    animationAmount += 1
//}
//.padding(50)
//.background(.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.overlay(                           // an overlay will provide a continuous
//    Circle()
//        .stroke(.red)
//        .scaleEffect(animationAmount)
//        .opacity(2-animationAmount)
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatForever(autoreverses: false),
//            value: animationAmount
//        )
//).onAppear {
//    animationAmount = 2
//}



// STATE BINDING ANIMATION
//print(animationAmount)

//return VStack{
////          Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
//    Stepper("Scare Amount", value: $animationAmount.animation(
//        .easeInOut(duration: 1)
//            .repeatCount(3, autoreverses: true)
//    ), in: 1...10)
//
//    Spacer()
//
//    Button("Tap Me") {
//        animationAmount += 1
//    }.padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//}

//EXPLICIT ANIMATION - Controlling the stack
//Button("Tap Me") {
//    //MAKE IT SPIN AROUND
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//        animationAmount += 360
//    }
//}
//.padding(50)
//.background(.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.rotation3DEffect(.degrees(animationAmount), axis:(x:0, y:1, z:0))



//Animating Gestures
//struct ContentView: View {
//    @State private var dragAmount = CGSize.zero
//    var body: some View {
//
//        ZStack {
//
//            LinearGradient(gradient: Gradient(colors: [.red,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .frame(width: 300, height: 200)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .offset(dragAmount)
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount = $0.translation}
//                        .onEnded{_ in
//                            withAnimation {
//                                dragAmount = .zero}
//                        }
//                )
//
//
//        }
//            //.animation(.spring(), value: dragAmount)


//import SwiftUI
//
//struct ContentView: View {
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    var body: some View {
//
//        HStack(spacing:0){
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .red : .blue)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num)/20), value: dragAmount)
//                //BY ADDING THIS DELAY IT GIVES IT THE SNAKE LIKE LOOK
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged{ dragAmount = $0.translation}
//                .onEnded{_ in
//                         dragAmount = .zero
//                         enabled.toggle()
//                }
//
//            )
//
//    }
//}
//



//SHOWING AND HIDING VIEWS - Assymetric transtion
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var isShowingRed = false
//    var body: some View {
//        VStack{
//            Button("Tap me"){
//                //nothing
//                withAnimation{
//                    isShowingRed.toggle()
//                }
//            }
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
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
