//
//  TrafficSignals.swift
//  TrafficLightSUIApp
//
//  Created by Stanislav Perepechin on 10/06/2023.
//

import SwiftUI

struct TrafficSignals: View {
    let color: Color
    let isHighlighted: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(isHighlighted ? color.opacity(10) : color.opacity(0.7))
                .frame(width: 150, height: 150)
                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                .shadow(radius: 10)
            
            if isHighlighted {
                Circle()
                    .foregroundColor(color.opacity(2))
                    .frame(width: 150, height: 150)
            }
        }
    }
}

struct TrafficSignals_Previews: PreviewProvider {
    static var previews: some View {
        TrafficSignals(color: .red, isHighlighted: false)
    }
}
