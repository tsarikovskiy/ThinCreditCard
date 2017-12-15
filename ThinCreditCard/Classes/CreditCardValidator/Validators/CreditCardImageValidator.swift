//
//  CreditCardImageValidator.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 06.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

import UIKit

final class CreditCardImageValidator {
    
    enum CreditCardImageSide {
        case number(String)
        case cvc
        
        var image: UIImage {
            switch self {
            case .number(let number):
                let formattedNumber = number.formattedCardNumber()
                guard let cardType = formattedNumber.suggestedCardType() else { return obtainImage(named: "Unknown") }
                
                switch cardType {
                case .visa:
                    return obtainImage(named: "Visa")
                case .amex:
                    return obtainImage(named: "Amex")
                case .dinersClub:
                    return obtainImage(named: "Diners Club")
                case .discover:
                    return obtainImage(named: "Discover")
                case .jcb:
                    return obtainImage(named: "JCB")
                case .mastercard:
                    return obtainImage(named: "MasterCard")
                default:
                    return obtainImage(named: "Unknown")
                }
            case .cvc:
                return obtainImage(named: "CVC")
            }
        }
        
        private func obtainImage(named: String) -> UIImage {
            guard let img = UIImage(named: named, in: Bundle.init(for: CreditCardImageValidator.self), compatibleWith: nil)
                else { return UIImage.init() }
                    
            return img
        }
    }
    
    class func image(side: CreditCardImageSide) -> UIImage {
        return side.image
    }
}
