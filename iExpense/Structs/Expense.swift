//
//  Expense.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

struct Expense:Identifiable,Codable {
    
    var id:UUID = UUID()
    
    let name:String
    let type:ExpenseType
    let amount:Double
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case type
        case amount
    }
    
    
}


