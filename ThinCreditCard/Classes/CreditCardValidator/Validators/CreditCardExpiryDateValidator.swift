//
//  CreditCardExpiryDateValidator.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 05.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

import Foundation

final class CreditCardExpiryDateValidator: CreditCardTextValidatorProtocol {
    
    var maxLength: Int {
        return 5 // 4 digits and 1 separtor
    }
 
    func validate(text: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yy"
        let date = formatter.date(from: text)
        
        if let validateDate = date, validateDate > Date() {
            return true
        }
        return false
    }
}
