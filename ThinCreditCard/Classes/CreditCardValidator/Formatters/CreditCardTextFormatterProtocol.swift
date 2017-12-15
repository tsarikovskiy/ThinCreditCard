//
//  CreditCardTextFormatterProtocol.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

enum CreditCardFormatterStyle {
    case number
    case expiryDate
    
    var countCharactersInGroup: Int {
        switch self {
        case .number:
            return 4
        case .expiryDate:
            return 2
        }
    }
    
    var separator: String {
        switch self {
        case .number:
            return " "
        case .expiryDate:
            return "/"
        }
    }
}

protocol CreditCardTextFormatterProtocol {
    func format(text: String) -> String
}

