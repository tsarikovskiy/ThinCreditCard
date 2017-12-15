//
//  CreditCardCvcValidator.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

final class CreditCardCvcValidator: CreditCardTextValidatorProtocol {
    
    var maxLength: Int {
        return 3
    }
    
    func validate(text: String) -> Bool {
        return true
    }
}
