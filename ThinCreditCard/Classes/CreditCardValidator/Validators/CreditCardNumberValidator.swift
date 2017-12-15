//
//  CreditCardNumberValidator.swift
//  MVisa
//
//  Created by Serg Tsarikovskiy on 05.12.17.
//  Copyright © 2017 Nullgravity. All rights reserved.
//

final class CreditCardNumberValidator: CreditCardTextValidatorProtocol {
    
    var maxLength: Int {
        return 19 // 16 digits and 3 separtors
    }
    
    func validate(text: String) -> Bool {
        let formattedNumber = text.formattedCardNumber()
        return formattedNumber.isValidCardNumber()
    }
}

