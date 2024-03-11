//
//  ProfileSceneView.swift
//  Dota2Technopark
//
//  Created by Кирилл Давыденков on 09.03.2024.
//

import SwiftUI

struct ProfileSceneView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(imageOnBackground: false, durationTime: 10)
                VStack {
                    ProfileInformationView()
                    NavigationListView()
                    Spacer()
                }
            }
        }
    }
}

struct ProfileInformationView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 15, content: {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.white.gradient)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                    .overlay {
                        VStack {
                            Image("avatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(8)
                                .padding(.top, -16)
                            Text("TSpirit.Yatoro")
                                .font(.system(size: 25))
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                                .padding(.horizontal, 8)
                        }
                    }
                VStack {
                  HeaderRateInformationRectangle()
                    HeaderInformationRectangle(topText: "9594", bottomText: "Матчи")
                }
                VStack {
               HeaderInformationRectangle(topText: "1294", bottomText: "MMR")
                HeaderInformationRectangle(topText: "51,64%", bottomText: "Победы")
                }
            })
            .padding(15)
            .frame(height: 250)
        }
    }
}

struct HeaderInformationRectangle: View {
    var topText: String
    var bottomText: String
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.white.gradient)
            .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
            .overlay {
                VStack {
                    VStack {
                        Text(topText)
                            .font(.system(size: 25))
                        Text(bottomText)
                            .font(.system(size: 20))
                    }
                }
            }
    }
        }

struct HeaderRateInformationRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.white.gradient)
            .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
            .overlay {
                VStack {
                    Image("rate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top)
                    Text("#52")
                        .font(.system(size: 20))
                }
            }
    }
}

struct NavigationListView: View {
    var body: some View {
        List {
            ForEach(0 ... 5, id: \.self) { _ in
                NavigationLink("Избранные команды", destination: {
                    
                })
            }
        }
        .scrollContentBackground(.hidden)
        .scrollDisabled(true)
        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
    }
}

#Preview {
    ProfileSceneView()
}
