//
//  ContentView.swift
//  AggieEats
//

import SwiftUI
import MapKit
import CodeScanner
//TODO: Import this package: https://github.com/twostraws/CodeScanner

struct HomePage: View {
    @State var showScanner = false // For QRCode Scanning
    @State var navigateToOrderingPage = false // Going to the ordering page...
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    HStack {
                        Text("Today's location")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        ScanQrCodeButton(showScanner: $showScanner)
                        //Add camera button latter
                    }
                    Text("Memorial Union")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } // inner VStack
                
                TruckLocationView()
                TodaysMenuView()
                
            } // outer VStack
        } // end of scrollview
        .sheet(isPresented: $showScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "ABCDE12345", completion: handleScan)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
// TODO: Uncomment This Function When Implementing QR Code Scanning.
  func handleScan(result: Result<ScanResult, ScanError>) {
       showScanner = false
        switch result {
        case .success(let result):
            navigateToOrderingPage = true
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct ScanQrCodeButton: View {
    @Binding var showScanner: Bool
    var body: some View {
        Button {
            showScanner = true
        } label: {
            Image(systemName: "camera")
                .imageScale(.large)
            }
        }
    }


struct TruckLocationView: View {
    var body: some View {
        Map {
            Marker("MU", coordinate: CLLocationCoordinate2D(latitude: 38.54141, longitude: -121.74845))
        }
        .frame(width: 370, height: 400)
        .padding(.bottom)
    }
}

struct TodaysMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("What's on the menu?")
                .font(.title)
                .fontWeight(.bold)
            MenuOptionsView()
        }
    }
}



#Preview {
    HomePage()
}
