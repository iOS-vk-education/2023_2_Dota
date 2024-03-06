//
//  Background.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 06.03.2024.
//

import SwiftUI

struct BackgroundView: View {
    let backgroundGradient = LinearGradient(
        colors: [Color.red, Color.blue],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Image("background1")
                        .resizable()
                        .frame(width: 500, height: 300)
                        .background(Color.clear)
                }
            }
        }
    }
}


#Preview {
    BackgroundView()
}
