//
//  CreditCardTextValidator.swift
//  MVisa
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Nullgravity. All rights reserved.
//

protocol CreditCardTextValidatorProtocol {
    var maxLength: Int { get }
    func validate(text: String) -> Bool
}
