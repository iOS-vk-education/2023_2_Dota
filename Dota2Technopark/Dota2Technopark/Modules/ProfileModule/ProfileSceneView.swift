//
//  ProfileSceneView.swift
//  Dota2Technopark
//
//  Created by Кирилл Давыденков on 09.03.2024.
//

import SwiftUI

struct ProfileSceneView: View {
    var body: some View {
        ZStack {
            BackgroundView(imageOnBackground: false, durationTime: 10)
            VStack {
                ProfileInformationView()
                NavigationView()
                Spacer()
            }
        }
    }
}

struct ProfileInformationView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 15, content: {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                    .overlay {
                        VStack {
                            Image("avatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(10)
                            Text("TSpirit.Yatoro")
                                .font(.system(size: 25))
                        }
                    }
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(.white)
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Image("rate")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top)
                                Text("#52")
                                    .font(.system(size: 25))
                            }
                        }
                    RoundedRectangle(cornerRadius: 25)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(.white)
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Text("9594")
                                    .font(.system(size: 25))
                                Text("Матчи")
                                    .font(.system(size: 25))
                            }
                        }
                }
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(.white)
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Text("1294")
                                    .font(.system(size: 25))
                                Text("MMR")
                                    .font(.system(size: 25))
                            }
                        }
                    RoundedRectangle(cornerRadius: 25)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(.white)
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Text("51,64%")
                                    .font(.system(size: 25))
                                Text("Победы")
                                    .font(.system(size: 25))
                            }
                        }
                }
            })
            .padding(15)
            .frame(height: 250)
        }
        
    }
}

struct NavigationView: View {
    var body: some View {
        VStack(spacing: -5) {
            VStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                    .frame(height: 50)
                    .padding(10)
                    .overlay {
                        HStack {
                            Text("Избранные команды")
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                    }
            })
            VStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                    .frame(height: 50)
                    .padding(10)
                    .overlay {
                        HStack {
                            Text("Избранные игроки")
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                    }
            })
            VStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                    .frame(height: 50)
                    .padding(10)
                    .overlay {
                        HStack {
                            Text("Настройки")
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                    }
            })
            VStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                    .frame(height: 50)
                    .padding(10)
                    .overlay {
                        HStack {
                            Text("О проекте")
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                    }
            })
            VStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                    .frame(height: 50)
                    .padding(10)
                    .overlay {
                        HStack {
                            Text("Выйти из учетной записи")
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                    }
            })
        }
    }
}

#Preview {
    ProfileSceneView()
}
