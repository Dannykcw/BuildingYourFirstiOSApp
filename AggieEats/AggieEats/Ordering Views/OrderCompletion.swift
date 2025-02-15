//
//  OrderCompletion.swift
//  AggieEats
//

import SwiftUI
import Stripe

struct OrderCompletion: View {
    @Binding var total: Decimal
    @State private var message: String = ""
    @State var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    
    func pay() {
            guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
                        print("No client secret")
                        message = "No client secret"
                        return
            } // get the client secret if it exists
            
            // credit card information assigned to an instance of STPPaymentIntentParams
            let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
            paymentIntentParams.paymentMethodParams = paymentMethodParams
            
            // payment submitted to Stripe and returns the status of submission
            paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
                
                print(String(describing: error))
                
                    switch status {
                        case .failed:
                            message = "Failed"
                        case .canceled:
                            message = "Cancelled"
                        case .succeeded:
                            message = "Your payment has been successfully completed!"
                    }
                    
                }
            
        }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order Summary")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            TotalView(total: $total) // from ConfirmOrderView.swift file
                .padding(.bottom)
            Section {
                // OrderCompletion.swift
                // write this code in the section under TotalView
                STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
            } header: {
                Text("Payment Information")
            }
            
            Button {
                pay()
            } label: {
                Text("Place Your Order")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .controlSize(.large)
            .padding(.bottom)
            
            Text(message)
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    OrderCompletion(total: .constant(1.00))
}
