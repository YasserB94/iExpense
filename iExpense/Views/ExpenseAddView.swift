//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct ExpenseAddView: View {
    @State private var name:String = ""
    @State private var type:ExpenseType = .personal
    @State private var amount:Double = 0.0
    
    
    
    var em:ExpenseManager
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name",text:$name)
                
                Picker(
                    "Type",
                    selection: $type
                ){
                    ForEach(
                        ExpenseType.allCases,
                        id:\.id
                    ){type in
                        Text(type.description.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code:"EUR")
                )
                .keyboardType(.decimalPad)
                
            }
            .navigationTitle("New Expense")
            .toolbar {
                Button {
                    em.addExpense(expense:                 Expense(
                        name: name,
                        type: type,
                        amount: amount
                    ))
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
        ExpenseAddView(em:ExpenseManager())
    }
}
