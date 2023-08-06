//
//  ContentView.swift
//  iConvert
//
//  Created by Justin Trubela on 12/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = 0.0
    @State private var selectedTemp = "Fahrenheit"
    @FocusState private var tempIsFocused: Bool
    private var temperatureUnits = ["Fahrenheit","Celsius","Kelvin"]
    
    var getTemps: [Double] {
        var temps = [0.0,0.0,0.0]
        if(selectedTemp == "Fahrenheit"){
            temps[0] = temperature
            temps[1] = ((temperature - 32.0) * (5.0/9.0))
            temps[2] = (temperature - 32.0) * (9.0/5.0) + 32.0
        }
        else if(selectedTemp == "Celsius"){
            temps[0] = (temperature * (9.0/5.0)) + 32.0
            temps[1] = temperature
            temps[2] = temperature + 273.15
        }
        else {
            temps[0] = (temperature - 273.15) * (9.0/5.0) + 32.0
            temps[1] = temperature - 273.15
            temps[2] = temperature
        }
        return temps
    }
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter Temperature", value: $temperature, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                    Picker("From \(selectedTemp)", selection: $selectedTemp){
                        ForEach(temperatureUnits, id: \.self){Text($0)}}.pickerStyle(.segmented)
                }

                Section{
                    Text("\(String(format: "%.1f",getTemps[0])) °F")
                } header: {Text("Farenheight")}
               
                Section{
                    Text("\(String(format: "%.1f",getTemps[1])) °C")
                } header: {Text("Celsius")}
                
                Section{
                    Text("\(String(format: "%.1f",getTemps[2])) °K")
                } header: {Text("Kelvin")
                }
                //Section{Text("\(getTemps[0].formatted()) °F")} header: {Text("Farenheight")}
                //Section{Text("\(getTemps[1].formatted()) °C")} header: {Text("Celsius")}
                //Section{Text("\(getTemps[2].formatted()) °K")} header: {Text("Kelvin")}
            }.navigationTitle("iConvert")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Spacer()
                        
                        Button("Done"){
                            tempIsFocused = false
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
}
