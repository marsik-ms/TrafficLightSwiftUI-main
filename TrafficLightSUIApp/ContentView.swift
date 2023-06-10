//
//  ContentView.swift
//  TrafficLightSUIApp
//
//  Created by Stanislav Perepechin on 10/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentColorIndex = 0
    let colors: [Color] = [.red, .yellow, .green]
    
    @State private var buttonText = "Start"
    @State private var isHighlighted = [true, false, false]
    
    var body: some View {
        
        VStack {
            TrafficSignals(color: colors[0], isHighlighted: isHighlighted[0])
                    .onTapGesture {
                        toggleHighlighted(index: 0)
                    }
                TrafficSignals(color: colors[1], isHighlighted: isHighlighted[1])
                    .onTapGesture {
                        toggleHighlighted(index: 1)
                    }
                TrafficSignals(color: colors[2], isHighlighted: isHighlighted[2])
                    .onTapGesture {
                        toggleHighlighted(index: 2)
                    }
            
            Spacer()
            
            Button(action: {
                self.currentColorIndex = (self.currentColorIndex + 1) % self.colors.count
                self.buttonText = "Next"
                self.resetHighlighted()
                self.isHighlighted[self.currentColorIndex] = true
            }) {
                    Text(buttonText)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .buttonStyle(.plain)
        }
        .padding()
    }
    
    func toggleHighlighted(index: Int) {
        isHighlighted[index].toggle()
    }
    
    func resetHighlighted() {
            isHighlighted = Array(repeating: false, count: colors.count)
        }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
