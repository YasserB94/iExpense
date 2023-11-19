//
//  ExpenseTypePicker.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct ExpenseTypePicker: View {
    @Binding var selection:ExpenseType
    var body: some View {
        Picker(
            "Expense Type",
            selection: $selection
        ){
            ForEach(
                ExpenseType.allCases,
                id:\.id
            ){type in
                Text(type.description.capitalized)
            }
        }
    }
}

struct ExpenseTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        
        Text("NO PREVIEW")
//        ExpenseTypePicker(selection:.personal)
//            .previewLayout(.sizeThatFits)
    }
}
