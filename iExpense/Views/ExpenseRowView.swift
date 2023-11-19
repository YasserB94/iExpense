//
//  ExpenseRowView.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct ExpenseRowView: View {
    let expense:Expense
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.type.description.capitalized)
                
                    .font(.caption)
            }
            Spacer()
            Text(
                expense.amount,
                format:.currency(
                    code:Locale.current.currency?.identifier ?? "EUR"
                )
            )
            .foregroundColor(
                getExpenseColor(expense: expense)
            )
        }
    }
    
    private func getExpenseColor(expense:Expense) -> Color
    {
        switch expense.amount {
        case 100...:
            return .red
        case 10...:
            return .orange
        default:
            return .primary
        }
    }
}
struct ExpenseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRowView(expense: Expense(name: "Preview", type: .personal, amount: 5.00))
    }
}
