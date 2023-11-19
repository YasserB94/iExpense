//
//  ExpenseManager.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

class ExpenseManager:ObservableObject {
    final private let UD_EXPENSES_KEY = "expenses"
    
    @Published var expenses:[Expense]{
        didSet{
            // Save expenses to UD on change
            if let encoded = try? JSONEncoder().encode(expenses){
                UserDefaults.standard.set(encoded, forKey: UD_EXPENSES_KEY)
            }
        }
    }
    
    init(){
        // Retrieve saved expenses
        guard let savedExpenses = UserDefaults.standard.data(forKey: UD_EXPENSES_KEY),
              // [Expense].self -> Use the Type, not a value of
              let decodedExpenses = try? JSONDecoder().decode([Expense].self, from: savedExpenses)
        else{
            //
            expenses = [Expense]()
            return;
        }
        expenses = decodedExpenses;
    }
    
    func getTotalExpenses(for type:ExpenseType)->Double{
        return self.expenses(for: type).reduce(0){$0 + $1.amount}
    }
    
    func expenses(for type:ExpenseType)->[Expense]{
        return expenses.filter { $0.type == type }
    }
    
    func addExpense(expense:Expense)
    {
        guard expense.amount > 0,
              !expense.name.isEmpty else{
            return
        }
        
        self.expenses.append(expense)
    }
    
    func removeExpenses(at offsets:IndexSet)
    {
        self.expenses.remove(atOffsets: offsets)
    }
    
    func removeExpenses(for uuids:[UUID]){
        self.expenses.removeAll { uuids.contains($0.id) }
    }
    
}
