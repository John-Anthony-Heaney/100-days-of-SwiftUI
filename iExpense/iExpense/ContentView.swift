//
//  ContentView.swift
//  iExpense
//
//  Created by John Anthony Heaney on 23/10/2024.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var personalItems = [ExpenseItem]() {
        didSet {
            if let personalEncoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(personalEncoded, forKey: "PersonalItems")
            }
        }
    }
    
    var businessItems = [ExpenseItem]() {
        didSet {
            if let businessEncoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(businessEncoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let personalSavedItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let businessSavedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
                if let personalDecodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: personalSavedItems) {
                    if let businessDecodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: businessSavedItems) {
                        personalItems = personalDecodedItems
                        businessItems = businessDecodedItems
                        return
                    }
                }
            }
        }
        
        personalItems = []
        businessItems = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            HStack {
                
               
                
                List {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            
                        }
                        .padding()
                        .background(item.amount < 10 ? Color.green : (item.amount <= 100 ? Color.yellow: Color.red))
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                    .onDelete(perform: removePersonalItems)
                    
                    
                    
                    
                }
                
                List {
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            
                        }
                        .padding()
                        .background(item.amount < 10 ? Color.green : (item.amount <= 100 ? Color.yellow: Color.red))
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                    .onDelete(perform: removeBusinessItems)
                    
                    
                    
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
