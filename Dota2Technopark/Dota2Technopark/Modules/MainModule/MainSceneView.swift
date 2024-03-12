//
//  MainView.swift
//  Dota2Technopark
//
//  Created by Кирилл Давыденков on 01.03.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            BackgroundView(imageOnBackground: false, durationTime: 10)
            VStack {
                MainHeaderView()
                MainContentView()
                    .ignoresSafeArea()
            }
        }
    }
}

struct MainHeaderView: View {
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
                    MainHeaderRateInformationRectangle()
                    MainHeaderInformationRectangle(topText: "9594", bottomText: "Матчи")
                }
                VStack {
                    MainHeaderInformationRectangle(topText: "1294", bottomText: "MMR")
                    MainHeaderInformationRectangle(topText: "51,64%", bottomText: "Победы")
                }
            })
            .padding(15)
            .frame(height: 250)
        }
    }
}

struct MainContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        self.selectedTab = 0
                    }
                }) {
                    Text("Последние матчи")
                        .padding()
                        .background(selectedTab == 0 ? Color.white : Color.clear)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                }
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                
                Button(action: {
                    withAnimation {
                        self.selectedTab = 1
                    }
                }) {
                    Text("Детальная статистика")
                        .padding()
                        .background(selectedTab == 1 ? Color.white : Color.clear)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                }
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
                
                Button(action: {
                    withAnimation {
                        self.selectedTab = 2
                    }
                }) {
                    Text("Любимые герои")
                        .padding()
                        .background(selectedTab == 2 ? Color.white : Color.clear)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                }
                .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
            }
            .padding()
            
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: -10) {
                        ForEach(0 ..< 10) { i in
                            MainListCellView()
                        }
                    }
                }
                .tag(0)
                
                VStack {
                    DetailedStatisticView()
                }
                .tag(1)
                
                ScrollView {
                    FavoriteHeroesView()
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .gesture(DragGesture()
                .onEnded({ value in
                    withAnimation {
                        if value.translation.width < 0 {
                            if self.selectedTab < 1 {
                                self.selectedTab += 1
                            }
                        } else if value.translation.width > 0 {
                            if self.selectedTab > 0 {
                                self.selectedTab -= 1
                            }
                        }
                    }
                })
            )
        }
    }
}

struct MainHeaderInformationRectangle: View {
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

struct MainHeaderRateInformationRectangle: View {
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

struct MainListCellView: View{
    var body: some View {
        VStack {
            HStack {
                Image("heroIcon")
                    .resizable()
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, content:
                        {
                    Text("Windranger")
                        .font(.system(size: 18))
                    Text("Immortal")
                        .font(.system(size: 14))
                    Spacer()
                })
                Spacer()
                
                VStack( alignment: .trailing, content: {
                    Text("4 часа назад")
                        .font(.system(size: 14))
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        HStack(alignment: .bottom, content: {
                            Text("37:12")
                                .font(.system(size: 18))
                            
                            RolesSellView()
                            
                            Text("9/5/5")
                                .font(.system(size: 18))
                        })
                        .frame(width: 190)
                        
                        Rectangle()
                            .frame(width: 190, height: 10)
                            .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            .overlay(
                                HStack {
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(width: 90, height: 10)
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.green)
                                        .frame(width: 50, height: 10)
                                }
                            )
                    }
                })
                Spacer()
                Rectangle()
                    .padding(-10)
                    .frame(width: 1)
                    .foregroundStyle(Color.green.gradient)
            }
            .padding(10)
            .background(Color.white.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .frame(height: 100)
        .padding(10)
        .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
    }
}

struct RolesSellView: View {
    var body: some View {
        HStack(spacing: 0, content: {
            Image("roleImage")
                .resizable()
                .frame(width: 25, height: 25)
            Image("lineImage")
                .resizable()
                .frame(width: 25, height: 25)
        })
    }
}

struct DetailedStatisticView: View {
    var body: some View {
        ScrollView {
            Text("Здесь будет таблица со статистикой за последние 20 матчей")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                .padding(20)
        }
    }
}

struct FavoriteHeroesView: View {
    var body: some View {
        ScrollView {
            Text("Здесь будет таблица с любимыми героями")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    MainView()
}
