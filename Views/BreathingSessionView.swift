//
//  BreathingSessionView.swift
//  IOSApp3 Watch App
//
//  Created by Jose Flores on 2025-10-23.
//

import SwiftUI
import WatchKit

struct BreathingSessionView: View {
    // State for the circle animation
    @State private var progress: CGFloat = 0
    @State private var isRunning = false
    @State private var quote: String = MotivationalQuote.randomQuote()
    
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🌿 Breathe with Faith")
                .font(.headline)
            
            Text(quote)
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .opacity(0.3)
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 100, height: 100)
                    .animation(.linear(duration: 0.05), value: progress)
            }
            
            Button(isRunning ? "Stop" : "Start") {
                isRunning.toggle()
                if isRunning {
                    quote = MotivationalQuote.randomQuote()
                } else {
                    WKInterfaceDevice.current().play(.success) // Vibrate when session ends
                    progress = 0
                }
            }
        }
        .onReceive(timer) { _ in
            guard isRunning else { return }
            progress += 0.01
            if progress >= 1 {
                progress = 0
                quote = MotivationalQuote.randomQuote()
                WKInterfaceDevice.current().play(.success)
            }
        }
        .padding()
    }
}
#Preview {
    BreathingSessionView()
}
