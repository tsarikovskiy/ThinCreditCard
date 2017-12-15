# ThinCreditCard

[![CI Status](http://img.shields.io/travis/tsarikovskiy/ThinCreditCard.svg?style=flat)](https://travis-ci.org/tsarikovskiy/ThinCreditCard)
[![Version](https://img.shields.io/cocoapods/v/ThinCreditCard.svg?style=flat)](http://cocoapods.org/pods/ThinCreditCard)
[![License](https://img.shields.io/cocoapods/l/ThinCreditCard.svg?style=flat)](http://cocoapods.org/pods/ThinCreditCard)
[![Platform](https://img.shields.io/cocoapods/p/ThinCreditCard.svg?style=flat)](http://cocoapods.org/pods/ThinCreditCard)

## Example
![](card.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
class ViewController: UIViewController {

    @IBOutlet weak var cardNumberView: CreditCardValidatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardNumberView.delegate = self
    }
}

extension ViewController: CreditCardValidatorViewDelegate {
    func didEditing(number: String) {
        // Play with card number
    }

    func didEditing(expiryDate: String) {
        // Play with expiry date
    }

    func didEditing(cvc: String) {
        // Play with cvc
    }
}
```
## Installation

ThinCreditCard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ThinCreditCard'
```

## License

ThinCreditCard is available under the MIT license. See the LICENSE file for more info.


## Questions or feedback?

Feel free to [open an issue](https://github.com/tsarikovskiy/ThinCreditCard/issues/new), or find me [@s_tsarikovskiy on Twitter](https://twitter.com/s_tsarikovskiy).
