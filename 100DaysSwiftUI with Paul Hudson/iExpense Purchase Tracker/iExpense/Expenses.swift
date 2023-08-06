//
//  Expenses.swift
//  iExpense
//
//  Created by Justin Trubela on 1/11/22.
//
// Creates a class of Expenses as an Observable Object to be used in other views which take on ExpenseItems initializer variables


// Storing user settings with UserDefaults!!
// One common way to read and write small amounts of user data -- UserDefaults easy for simple data


// Arching Swift objects with Codable
// working with Structs we use Codable -- still need to tell it when to do it
//  swift will automatically generate J(ava) S(cript) O(object) N(otation) format to be stored and read back out again
// call the json using an JSONEncoder to store and use JSONDecoder to retrieve


// @Published - we want to notify our views that are watching our class that a change has happened
// @Published is more or less half of @State: it tells Swift that whenever either of those two properties changes, it should send an announcement out to any SwiftUI views that are watching that they should reload.
//

import Foundation

class Expenses: ObservableObject {

    @Published var items = [ExpenseItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                self.items = decodedItems
                return
            }
        }
        
        self.items = []
    }
}


class BusinessExpenses: ObservableObject {
    @Published var businessItems = [ExpenseItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                self.businessItems = decodedItems
                return
            }
        }
        
        self.businessItems = []
    }
}
