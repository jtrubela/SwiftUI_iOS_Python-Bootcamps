//
//  ContentView.swift
//  WeSplit
//
//  Created by Justin Trubela on 12/8/21.
//
//  Demonstrates the use of:
//      @State and @FocusState Property Wrappers
//      Navigation View/Navigation Titles,Form/Group/Section & Section heading/,
//      Textfield to get text from user,
//      Text to show back to user
//          data binding using $ wrapper
//          formatting of text
//              .locale to gather local economic/scientific values in region
//              .currency to format into $USD - "USD"
//      Picker and PickerStyles and use of ForEach when child views can only show 10 fields
//      Toolbar/ToolbarItemGroup methods
//      Spacer() to space things out
//



import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPpl = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    @State private var zeroTip = false

    
    private var tipPercentages = [10,15,20,25,0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPpl + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var grandTotal: Double { checkAmount * (Double(tipPercentage)/100.0 + 1.0) }
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section{
                    
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPpl){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                   
                    }
                } header: {
                    Text("Enter bill amount and number of people")
                }
                //Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    //.pickerStyle(.segmented)
                    .pickerStyle(.menu)
                } header: {
                    Text("How much would you like to tip?")
                }
                
                //Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
                Section{
                    Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Grand Total")
                    .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                
                //Add a header to the third section, saying “Amount per person”
                Section{
                    Text(totalPerPerson,
                         format:
                                .currency(code:Locale
                                .current
                                .currencyCode ?? "USD"))
                }header: {
                    Text("Total to pay per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
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
