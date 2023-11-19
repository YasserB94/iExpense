//
//  ExpenseType.swift
//  iExpense
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation
enum ExpenseType: CaseIterable,Identifiable,CustomStringConvertible,Codable {

    
    case personal
    case business
    
    var id:Self{self}
    
    var description:String{
        switch self{
        case .business: return "business";
        case .personal: return "personal";
        }
    }
    
    enum CodingKeys: CodingKey {
        case personal
        case business
    }
}
