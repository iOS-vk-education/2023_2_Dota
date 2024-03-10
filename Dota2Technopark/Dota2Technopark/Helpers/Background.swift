//  Background.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 06.03.2024.
//

import SwiftUI


struct AnimatedGradientView: View {
    let durationTime: TimeInterval
    @Binding var currentColors: [Color]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: currentColors), startPoint: .top, endPoint: .bottom)
            .animation(Animation.linear(duration: durationTime).repeatForever())
            .onAppear {
                withAnimation{
                    currentColors.reverse()
                }
            }
            .ignoresSafeArea()
    }
}


struct AnimatingGradientBuilder: View {
    @State private var currentColors: [Color]
    private let durationTime: TimeInterval

    init(backgroundColors: [Color], durationTime: TimeInterval) {
        self._currentColors = State(initialValue: backgroundColors)
        self.durationTime = durationTime
    }

    var body: some View {
        ZStack {
            AnimatedGradientView(durationTime: durationTime, currentColors: $currentColors)
            Image("background1")
                .resizable()
                .frame(width: 400, height: 222)
        }
    }
}

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    var imageOnBackground: Bool
    var durationTime: Int
    var body: some View {
        if colorScheme == .dark{
            AnimatingGradientBuilder(backgroundColors: [Color.black, Color.cyan], durationTime: TimeInterval(durationTime))
        } else {
            AnimatingGradientBuilder(backgroundColors: [Color.white, Color.mint], durationTime: TimeInterval(durationTime))
        }
        if imageOnBackground == true {
            Image("backgroundImage")
               .resizable()
               .frame(width: 400, height: 222)
        } else {
            
        }
        
    }
}

#Preview {
    BackgroundView(imageOnBackground: false, durationTime: 5)
}
