//
//  PaymentGatewayController.swift
//  AggieEats
//

import Foundation
import Stripe
import UIKit

class PaymentGatewayController: UIViewController {
    
    func submitPayment() {
        // TODO: implementation of final submission of payment
    }
}

extension PaymentGatewayController: STPAuthenticationContext {
    func authenticationPresentingViewController() -> UIViewController {
          return self
      }
}
