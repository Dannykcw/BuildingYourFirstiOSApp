//
//  TabBarView.swift
//  AggieEats
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
//        Text("Hello, World!")
        TabView{
            Tab("Today", systemImage: "house") {
                HomePage()
            }
            Tab("Weekly Menu", systemImage: "menucard") {
                HomePage()
            }
        }
    }
}

#Preview {
    TabBarView()
}
