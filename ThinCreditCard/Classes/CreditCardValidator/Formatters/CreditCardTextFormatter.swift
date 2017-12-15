//
//  CreditCardExpiryDateFormatter.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 05.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

final class CreditCardTextFormatter: CreditCardTextFormatterProtocol {
    
    private let style: CreditCardFormatterStyle
    
    init(style: CreditCardFormatterStyle) {
        self.style = style
    }
    
    func format(text: String) -> String {
        let trimmedString = text.components(separatedBy: style.separator).joined()
        var formattedString = ""
        
        for (i, character) in trimmedString.enumerated() {
            formattedString.append(character)
            if ((i + 1) % style.countCharactersInGroup == 0 && i + 1 != trimmedString.count) {
                formattedString.append(style.separator)
            }
        }
        return formattedString
    }
}
