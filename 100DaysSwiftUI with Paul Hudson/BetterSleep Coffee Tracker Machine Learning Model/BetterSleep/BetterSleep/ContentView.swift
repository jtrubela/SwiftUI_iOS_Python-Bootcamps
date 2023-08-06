//
//  ContentView.swift
//  BetterSleep
//
//  Created by Justin Trubela on 12/26/21.
//

import CoreML
import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 100, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 20))
            .foregroundColor(.white)
    }
}
extension View {
    func makeRoundedBackground () -> some View{
        modifier(RoundedBackground())
    }
}

struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.black)
            .padding()
    }
}

extension View {
    func addTextStyle () -> some View {
        modifier(TextStyle())
    }
}

struct ListView: View {
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .black
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
                                                                        
    var bedtime: String {
        calculateBedTime()
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple,.black,.black], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
            NavigationView {
                ZStack {
                    LinearGradient(colors: [.purple,.black,.black], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
                    VStack{
                        Spacer()
                        Spacer()
                        VStack(alignment: .center){
                            Text("Set wake up time:")
                                .addTextStyle()
                            
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents:
                                .hourAndMinute)
                                .labelsHidden()
                                .addTextStyle()
                        }
                        .makeRoundedBackground()
                        
                        VStack(alignment: .center, spacing: 0){
                            Text("Desired amount of sleep")
                                .addTextStyle()
                            Stepper("  \(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                                .addTextStyle()
                        }
                        .makeRoundedBackground()
                        
                        VStack(alignment: .center, spacing: 0){
                            Text("Daily coffee intake")
                                .addTextStyle()
                            
                            Picker(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                                ForEach(1..<21) {
                                    if $0 == 1{
                                        Text("1 cup")
                                    }
                                    else{
                                        Text("\($0) cups")
                                    }
                                }
                            }
                            //Stepper(coffeeAmount == 1 ? "1 cup": "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20).foregroundColor(.black).padding()
                        }
                        .makeRoundedBackground()
                        
                        
                        Spacer()
                        Spacer()

                        Section(header: Text("You should get to bed around: ").font(.title3)){
                            
                            Text("\(bedtime)").font(.system(size: 50.0))
                            Spacer()
                            Text("\tSleep Better\n with BetterSleep").font(.largeTitle.italic())
                        }
                    }
                    .navigationTitle("BetterSleep")
                    
//                    .toolbar {Button("Calculate", action: calculateBedTime)}
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).clipShape(RoundedRectangle(cornerRadius: 60))
//           .alert(alertTitle, isPresented: $showingAlert){Button("Continue"){}}
            .padding()
        }
    }
    
    func calculateBedTime()-> String{
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep

            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: sleepTime)
        } catch {

            return "Error"
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
