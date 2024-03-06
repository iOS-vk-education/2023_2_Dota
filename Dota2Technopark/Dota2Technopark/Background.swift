//
//  Background.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 06.03.2024.
//

import SwiftUI


struct AnimatedGradientViewLight: View {
    @Environment(\.colorScheme) var colorScheme
    @State var gradientColors = [Color.purple, Color.mint] //Light
    let durationTime: Int
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
            .animation(Animation.linear(duration: TimeInterval(durationTime)).repeatForever())
            .onAppear {
                withAnimation{
                    determineColorsForCurrentTheme()
                }
            }
    }
    private func determineColorsForCurrentTheme() {
        withAnimation {
            gradientColors = [Color.mint, Color.purple]
            }
        }
}



struct AnimatedGradientViewDark: View {
    @Environment(\.colorScheme) var colorScheme
    @State var gradientColors = [Color.cyan, Color.black] //Dark
    let durationTime: Int
    var body: some View {
        LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
            .animation(Animation.linear(duration: TimeInterval(durationTime)).repeatForever())
            .onAppear {
                withAnimation{
                    determineColorsForCurrentTheme()
                }
            }
    }
    private func determineColorsForCurrentTheme() {
        withAnimation {
            if colorScheme == .dark {
                gradientColors = [Color.black, Color.cyan] // Цвета для темной темы
            }
        }
    }
}


struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    let durationTime = 5
    var body: some View {
        ZStack {
            if colorScheme == .light {
                AnimatedGradientViewLight(durationTime: durationTime)
                    .ignoresSafeArea()
            } else {
                AnimatedGradientViewDark(durationTime: durationTime)
                    .ignoresSafeArea()
            }
            Image("background1")
                .resizable()
                .frame(width: 400, height: 222)
        }
    }
}

#Preview {
    BackgroundView()
}
