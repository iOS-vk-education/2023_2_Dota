//
//  DetailView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 04.03.2024.
//

import SwiftUI

struct DetailView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab: TabState = .main
    
    let buttons: [TabBarButtonConfiguration] = [
        .init(name: "Поиск", image: Image(systemName: "magnifyingglass"), tag: .search),
        .init(name: "Главная", image: Image(systemName: "house"), tag: .main),
        .init(name: "Профиль", image: Image(systemName: "gear"), tag: .settings)
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                
                MainView().tag(TabState.main)
                NavigationTabView(tabs: SegmentedTab.allCases).tag(TabState.search)
                Text("1").tag(TabState.settings)
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
                    .padding(.bottom, 20)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                    .background(TabBarColors.tabBarBackground)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


struct TabBarItem: View {
    @State var config: TabBarButtonConfiguration
    @State private var flagToggle = false
    
    @Binding var selectedTab: TabState
    
    var body: some View {
        if config.tag == .settings {
            Button {
                withAnimation(.easeInOut) {
                    selectedTab = config.tag
                }
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 28, height: 28)
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
                .opacity(selectedTab == config.tag ? 1 : 0.5)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(selectedTab == config.tag ? TabBarColors.selectedTabBackground : TabBarColors.tabBarBackground)
                .clipShape(Capsule())
            }
        } else {
            TabBarButton(config: config, selectedTab: $selectedTab, flagToggle: $flagToggle)
        }
    }
}

struct TabBarButton: View {
    var config: TabBarButtonConfiguration
    @Binding var selectedTab: TabState
    @Binding var flagToggle: Bool
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.easeInOut) {
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
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(selectedTab == config.tag ? TabBarColors.selectedTabBackground : TabBarColors.tabBarBackground)
        .clipShape(Capsule())
    }
}

#Preview {
    DetailView()
}
