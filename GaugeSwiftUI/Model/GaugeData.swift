//
//  GaugeData.swift
//  GaugeSwiftUI
//
//  Created by Rahul Sharma on 05/03/22.
//

import Foundation
import CoreGraphics

struct GaugeData: Identifiable {
    
    let id = UUID()
    
    var value: CGFloat?
    
    var minimunValue: CGFloat
    var maximimValue: CGFloat
    
    var minimunTrackValue: CGFloat
    var maximimTrackValue: CGFloat
    
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
