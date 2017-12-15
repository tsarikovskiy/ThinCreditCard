//
//  CreditCardTextValidator.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

protocol CreditCardTextValidatorProtocol {
    var maxLength: Int { get }
    func validate(text: String) -> Bool
}
