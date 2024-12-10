import SwiftData

@Observable
class Expenses {
    private let modelContext: ModelContext

    // Use plain arrays to manage expenses
    var personalItems: [ExpenseItem] = []
    var businessItems: [ExpenseItem] = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadExpenses()
    }

    // Fetch expenses from the database and categorize them
    func loadExpenses() {
        let allItems: [ExpenseItem] = try! modelContext.fetch(FetchDescriptor<ExpenseItem>())
        personalItems = allItems.filter { $0.type == "Personal" }
        businessItems = allItems.filter { $0.type == "Business" }
    }

    // Add a new expense to the database
    func addExpense(name: String, type: String, amount: Double) {
        let newExpense = ExpenseItem(name: name, type: type, amount: amount)
        modelContext.insert(newExpense)
        loadExpenses()
    }

    // Remove an expense from the database
    func removeExpense(_ expense: ExpenseItem) {
        modelContext.delete(expense)
        loadExpenses()
    }
}
