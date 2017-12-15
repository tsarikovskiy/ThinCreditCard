//
//  ViewController.swift
//  ThinCreditCard
//
//  Created by tsarikovskiy on 12/14/2017.
//  Copyright (c) 2017 tsarikovskiy. All rights reserved.
//

import UIKit
import ThinCreditCard

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardExpirationLabel: UILabel!
    @IBOutlet weak var cardCvcLabel: UILabel!
    @IBOutlet weak var cardNumberView: CreditCardValidatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        cardNumberView.delegate = self
    }
}

// MARK: - CreditCardValidatorViewDelegate
extension ViewController: CreditCardValidatorViewDelegate {
    func didEditing(number: String) {
        cardNumberLabel.text = "Number: " + number
    }
    
    func didEditing(expiryDate: String) {
        cardExpirationLabel.text = "Expiry Date: " + expiryDate
    }
    
    func didEditing(cvc: String) {
        cardCvcLabel.text = "CVC: " + cvc
    }
}

