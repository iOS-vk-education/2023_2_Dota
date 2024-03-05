//
//  DetailView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 04.03.2024.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab: TabState = .main
    
    let buttons: [ButtonConfiguration] = [
        .init(name: "Поиск", image: Image(systemName: "magnifyingglass"), tag: .search),
        .init(name: "Главная", image: Image(systemName: "house"), tag: .main),
        .init(name: "Профиль", image: Image(systemName: "gear"), tag: .settings)
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("1").tag(TabState.search)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                Text("2").tag(TabState.main)
                    .tabItem {
                        Image(systemName: "house")
                    }
                Text("3").tag(TabState.settings)
                    .tabItem {
                        Image(systemName: "gear")
                    }
            }
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    HStack {
                        ForEach(buttons, id: \.self) { button in
                            TabBarItem(config: button, selectedTab: $selectedTab)
                                .padding(.horizontal, 15)
                        }
                    }
                    .padding(.bottom, 30)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                    .background(TabBarColors.tabBarBackground)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct TabBarItem: View {
    @State var config: ButtonConfiguration
    @State private var flagToggle = false
    
    @Binding var selectedTab: TabState
    
    var body: some View {
        if config.tag == .settings {
            Button {
                withAnimation(.spring()) {
                    selectedTab = config.tag
                }
            } label: {
                ZStack {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(selectedTab == config.tag ? TabBarColors.selectedProfile : TabBarColors.selectedTabBackground)
                            Image("WidgetBackground") // TODO: Заменить на ту что приходит с бека
                                .resizable()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                        }
                        if selectedTab == config.tag {
                            Text(config.name)
                                .font(.system(size: 14))
                                .foregroundColor(TabBarColors.textForeground)
                        }
                    }
                }
                .opacity(selectedTab == config.tag ? 1 : 0.5)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(selectedTab == config.tag ? TabBarColors.selectedTabBackground : TabBarColors.tabBarBackground)
                .clipShape(Capsule())
            }
        } else {
            if #available(iOS 17.0, *) {
            TabBarButton(config: config, selectedTab: $selectedTab, flagToggle: $flagToggle)
                .symbolEffect(.bounce.down, value: flagToggle)
            } else {
                TabBarButton(config: config, selectedTab: $selectedTab, flagToggle: $flagToggle)
            }
        }
    }
}

struct TabBarButton: View {
    var config: ButtonConfiguration
    @Binding var selectedTab: TabState
    @Binding var flagToggle: Bool
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.spring()) {
                    selectedTab = config.tag
                }
                flagToggle.toggle()
            } label: {
                HStack {
                    config.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23, height: 23)
                        .foregroundColor(TabBarColors.imageForeground)
                    if selectedTab == config.tag {
                        Text(config.name)
                            .font(.system(size: 14))
                            .foregroundColor(TabBarColors.textForeground)
                    }
                }
            }
            Spacer()
        }
        .opacity(selectedTab == config.tag ? 1 : 0.6)
        .padding(.horizontal, 15)
        .padding(.vertical, 7)
        .background(selectedTab == config.tag ? TabBarColors.selectedTabBackground : TabBarColors.tabBarBackground)
        .clipShape(Capsule())
    }
}

struct DetailView_Provider: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
