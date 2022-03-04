//
//  GaugeView.swift
//  GaugeSwiftUI
//
//  Created by Rahul Sharma on 04/03/22.
//

import SwiftUI

struct GaugeData: Identifiable {
    
    let id = UUID()
    
    var value: CGFloat?
    
    var minimunValue: CGFloat
    var maximimValue: CGFloat
    
    var minimunTrackValue: CGFloat
    var maximimTrackValue: CGFloat
    
}

struct GaugeView: View {
    
    var gaugeData: GaugeData
    
    func offset(for value: CGFloat) -> CGFloat {
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
                    .frame(height: 10.0)
                if let value = gaugeData.value {
                    Circle()
                        .fill(.white)
                        .frame(width: 7.0, height: 7.0)
                        .offset(x: (proxy.size.width - 10) * offset(for: value))
                }
            }
        }
        .frame(height: 10.0)
    }
    
}

func sampleGaugesData() -> [GaugeData] {
    var data: [GaugeData] = []
    data.append(contentsOf: [
        GaugeData(
            value: 24,
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 11,
            maximimTrackValue: 24
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 11,
            maximimTrackValue: 26
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 13,
            maximimTrackValue: 26
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 16,
            maximimTrackValue: 28
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 14,
            maximimTrackValue: 28
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 15,
            maximimTrackValue: 29
        ),
        GaugeData(
            minimunValue: 11,
            maximimValue: 32,
            minimunTrackValue: 16,
            maximimTrackValue: 32
        )
    ])
    return data
}

let sampleGaugeData = sampleGaugesData().first!

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView(gaugeData: sampleGaugeData)
    }
}
