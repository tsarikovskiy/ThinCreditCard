//
//  CreditCardCvcValidator.swift
//  MVisa
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Nullgravity. All rights reserved.
//

final class CreditCardCvcValidator: CreditCardTextValidatorProtocol {
    
    var maxLength: Int {
        return 3
    }
    
    func validate(text: String) -> Bool {
        return true
    }
}
