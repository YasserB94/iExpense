//
//  ExpenseListView.swift
//  iExpense
//
//  Created by Yasser Bal on 12/11/2023.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject private var em = ExpenseManager()
    @State private var isShowingAddView:Bool = false
    @State private var searchString:String = "";
    
    @State private var expenseTypeSelection:ExpenseType = .personal
    
    var body: some View {
        NavigationStack{
            List {
                ExpenseTypePicker(
                    selection: $expenseTypeSelection
                )
                .pickerStyle(.segmented)
                
                ForEach(
                    em.expenses(
                        for: expenseTypeSelection
                    ),
                    id:\.id
                ){
                    expense in
                    ExpenseRowView(expense: expense)
                }
                .onDelete { indexes in
                    em.removeExpenses(for: indexes.map({ i in
                        em.expenses(for: expenseTypeSelection)[i].id
                    }))
                }
            }
            Divider()
            HStack{
                Text("Total")
                Spacer()
                Text(
                    em.getTotalExpenses(for: expenseTypeSelection),
                    format:.currency(
                        code:Locale.current.currency?.identifier ?? "EUR"
                    )
                )
            }.padding(.horizontal,40)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    isShowingAddView.toggle()
                } label: {
                    Label("Add an expense",systemImage: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddView) {
                ExpenseAddView(em:em,type:expenseTypeSelection)
            }
        }

        
        
        
    }
}



struct MainView_Previews:
    PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
