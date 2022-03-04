//
//  ContentView.swift
//  GaugeSwiftUI
//
//  Created by Rahul Sharma on 04/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            ForEach(sampleGaugesData()) { data in
                GaugeRow(gaugeData: data)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
