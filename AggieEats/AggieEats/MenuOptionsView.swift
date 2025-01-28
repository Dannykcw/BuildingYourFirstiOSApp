//
//  MenuOptionsView.swift
//  AggieEats
//

import SwiftUI

struct MenuOptionsView: View {
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Menu Options Color"))
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text("Chicken Bowl")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Out of stock")
                    .fontWeight(.medium)
                    .foregroundStyle(.red)
            }
            .padding()
        }
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Menu Options Color"))
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text("Hummus and Cucumber sandwich")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Limited avialiblity")
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
            }
            .padding()
        }
    }
}
    
    #Preview {
        MenuOptionsView()
    }
