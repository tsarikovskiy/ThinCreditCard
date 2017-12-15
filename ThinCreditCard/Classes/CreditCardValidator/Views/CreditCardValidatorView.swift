//
//  CreditCardValidatorView.swift
//  ThinCreditCard
//
//  Created by Serg Tsarikovskiy on 04.12.17.
//  Copyright © 2017 Serg Tsarikovskiy. All rights reserved.
//

import UIKit

public protocol CreditCardValidatorViewDelegate: class {
    func didEditing(number: String)
    func didEditing(expiryDate: String)
    func didEditing(cvc: String)
}

open class CreditCardValidatorView: NibView {
    
    // MARK: - Constants
    struct C {
        static let duration = 0.4
        static let activeNumberWidth: CGFloat = 200
        static let activeExpiryDateWidth: CGFloat = 120
        static let activeCvcWidth: CGFloat = 120
    }
    
    // MARK: - Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNumberTextField: CreditCardInfoTextField!
    @IBOutlet weak var expiryDateTextField: CreditCardInfoTextField!
    @IBOutlet weak var cvcTextField: CreditCardInfoTextField!
    @IBOutlet weak var numberWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var cvcWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var expiryDateWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    open weak var delegate: CreditCardValidatorViewDelegate?
    
    private var isExpiryDateVisible: Bool {
        return expiryDateWidthConstraint.constant > 0
    }
    
    // MARK: - Lifecycle
    override open func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        cardNumberTextField.infoDelegate = self
        expiryDateTextField.infoDelegate = self
        cvcTextField.infoDelegate = self
        
        let numberFormatter = CreditCardTextFormatter(style: .number)
        let expiryFormatter = CreditCardTextFormatter(style: .expiryDate)
        
        cardNumberTextField.configure(info: .number,
                                      validator: CreditCardNumberValidator(),
                                      formatter: numberFormatter)
        
        expiryDateTextField.configure(info:.expiryDate,
                                      validator: CreditCardExpiryDateValidator(),
                                      formatter: expiryFormatter)
        
        cvcTextField.configure(info: .cvc, validator: CreditCardCvcValidator())
    }
}

// MARK: - CreditCardInfoTextFieldDelegate
extension CreditCardValidatorView: CreditCardInfoTextFieldDelegate {
    
    func didEdited(textField: CreditCardInfoTextField, with text: String) {
        switch textField {
        case cardNumberTextField:
            cardImageView.image = CreditCardImageValidator.image(side: .number(text))
            delegate?.didEditing(number: text)
        case expiryDateTextField:
            delegate?.didEditing(expiryDate: text)
        case cvcTextField:
            cardImageView.image = CreditCardImageValidator.image(side: .cvc)
            delegate?.didEditing(cvc: text)
        default:
            break
        }
    }
    
    func didResignFirstResponder(textField: CreditCardInfoTextField) {
        switch textField {
        case cardNumberTextField:
            animateCurtailNumberField()
            expiryDateTextField.becomeFirstResponder()
        case expiryDateTextField:
            cvcTextField.becomeFirstResponder()
            cardImageView.image = CreditCardImageValidator.image(side: .cvc)
        default:
            break
        }
    }
    
    func didBecomeFirstResponder(textField: CreditCardInfoTextField) {
        switch textField {
        case cardNumberTextField:
            guard isExpiryDateVisible else { break }
            animateExpandNumberField()
        default:
            break
        }
    }
}

// MARK: - Animations
private extension CreditCardValidatorView {
    
    func animateExpandNumberField() {
        numberWidthConstraint.constant = C.activeNumberWidth
        expiryDateWidthConstraint.constant = 0
        cvcWidthConstraint.constant = 0
        
        UIView.animate(withDuration: C.duration) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
    
    func animateCurtailNumberField() {
        numberWidthConstraint.constant = 0
        expiryDateWidthConstraint.constant = C.activeExpiryDateWidth
        cvcWidthConstraint.constant = C.activeCvcWidth
        
        UIView.animate(withDuration: C.duration) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
}
