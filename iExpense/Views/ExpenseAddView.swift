//
//  ExpenseAddView.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct ExpenseAddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name:String = ""
    @State private var amount:Double = 0.0
    
    var em:ExpenseManager
    @State var type:ExpenseType

    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name",text:$name)
                ExpenseTypePicker(selection: $type)
                    .pickerStyle(.segmented)
                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(                   code:Locale.current.currency?.identifier ?? "EUR"
                                     )
                )
                
            }
            .navigationTitle("New Expense")
            .toolbar {
                Button {
                    em.addExpense(expense:                 Expense(
                        name: name,
                        type: type,
                        amount: amount
                    ))
                    dismiss()
                } label: {
                    HStack{
                        Text("Save")
                        Image(systemName: "tray.and.arrow.down")
                    }
                }
            }
            
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseAddView(em:ExpenseManager(),type:.personal)
    }
}
