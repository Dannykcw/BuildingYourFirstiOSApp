//
//  AggieEatsApp.swift
//  AggieEats
//

import SwiftUI
import Stripe

@main
struct AggieEatsApp: App {
    init() {
        if let stripe_pub_api = ProcessInfo.processInfo.environment["STRIPE_API_PUB"] {
            StripeAPI.defaultPublishableKey = stripe_pub_api
        } else {
            print("No api key found")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
