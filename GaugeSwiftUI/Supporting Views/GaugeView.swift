//
//  GaugeView.swift
//  GaugeSwiftUI
//
//  Created by Rahul Sharma on 04/03/22.
//

import SwiftUI

struct GaugeView: View {
    
    var gaugeData: GaugeData
    
    func offset(for value: CGFloat) -> CGFloat {
        if value < gaugeData.minimunTrackValue { return 0 }
        if value > gaugeData.maximimTrackValue { return 1 }
        let offset = (value - gaugeData.minimunTrackValue) / (gaugeData.maximimTrackValue - gaugeData.minimunTrackValue)
        return offset
    }
    
    var startPoint: UnitPoint {
        let offset = (0 - gaugeData.minimunTrackValue) / (gaugeData.maximimTrackValue - gaugeData.minimunTrackValue)
        return UnitPoint(
            x: offset,
            y: 0.5
        )
    }
    
    var endPoint: UnitPoint {
        let offset = (35 - gaugeData.minimunTrackValue) / (gaugeData.maximimTrackValue - gaugeData.minimunTrackValue)
        return UnitPoint(
            x: offset,
            y: 0.5
        )
    }
    
    var colors: [Color] {
        [.cyan, .teal, .yellow, .orange, .red]
    }
    
    var GAUGE_HEIGHT: CGFloat {
        10.0
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: colors,
                            startPoint: startPoint,
                            endPoint: endPoint
                        )
                    )
                    .frame(height: GAUGE_HEIGHT)
                if let value = gaugeData.value {
                    Circle()
                        .strokeBorder(Color.white.opacity(0.4), lineWidth: 2.0)
                        .overlay(
                            Circle()
                                .fill(Color.white)
                                .padding(2.0)
                        )
                        .frame(width: GAUGE_HEIGHT, height: GAUGE_HEIGHT)
                        .offset(x: (proxy.size.width - GAUGE_HEIGHT) * offset(for: value))
                }
            }
        }
        .frame(height: GAUGE_HEIGHT)
    }
    
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView(gaugeData: sampleGaugeData)
            .padding()
    }
}
