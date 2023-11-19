//
//  MainViewModel.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

class ExpenseManager:ObservableObject {
    @Published var expenses:[Expense];
    
    init(){
        expenses = [Expense]()
    }
    
    func addExpense(expense:Expense)
    {
        self.expenses.append(expense)
    }
    
    func removeExpense(at offsets:IndexSet)
    {
        self.expenses.remove(atOffsets: offsets)
    }
    
}
