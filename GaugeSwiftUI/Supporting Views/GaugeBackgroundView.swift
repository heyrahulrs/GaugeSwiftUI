//
//  GaugeBackgroundView.swift
//  GaugeSwiftUI
//
//  Created by Rahul Sharma on 04/03/22.
//

import SwiftUI

struct GaugeBackgroundView: View {
    var body: some View {
        Capsule()
            .fill(.quaternary)
            .frame(height: 10.0)
    }
}

struct GaugeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeBackgroundView()
    }
}
