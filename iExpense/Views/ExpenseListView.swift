//
//  MainView.swift
//  iExpense
//
//  Created by Yasser Bal on 12/11/2023.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject private var em = ExpenseManager()
    @State private var isShowingAddView:Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                Text("good expense")
                ForEach(em.expenses,id: \.id) { expense in
                    Text(expense.name)
                }
                .onDelete(perform: em.removeExpense)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    isShowingAddView.toggle()
                } label: {
                    Label("Add an expense",systemImage: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddView) {
                AddExpenseView(em:em)
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
