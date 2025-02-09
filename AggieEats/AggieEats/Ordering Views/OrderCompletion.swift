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
        // pay functionality, to submit the final payment to Stripe from user's credit card.
        // TODO: Pay functionality
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
                // Stripe Credit Card TextField Here
                // TODO: Credit card text field
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
