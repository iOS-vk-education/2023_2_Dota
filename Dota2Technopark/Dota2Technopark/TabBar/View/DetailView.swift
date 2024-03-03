//
//  DetailView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 04.03.2024.
//

import Foundation
import SwiftUI

enum TabState {
    case search
    case main
    case settings
}

struct ButtonConfiguration: Hashable {
    let name: String
    let image: Image
    let tag: TabState
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(tag)
    }
    
    static func == (lhs: ButtonConfiguration, rhs: ButtonConfiguration) -> Bool {
        return lhs.name == rhs.name && lhs.tag == rhs.tag
    }
}

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
            Color.gray
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
                    .padding(.vertical, 5)
                    .padding(.bottom, 35)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.12)
                    .background(Color.gray)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct TabBarItem: View {
    @State var config: ButtonConfiguration
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
                                .foregroundColor(selectedTab == config.tag ? Color.green : Color.white)
                            Image("WidgetBackground") // TODO: Заменить на ту что приходит с бека
                                .resizable()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                        }
                        if selectedTab == config.tag {
                            Text(config.name)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                    }
                }
                .opacity(selectedTab == config.tag ? 1 : 0.5)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(selectedTab == config.tag ? Color.white : Color.gray)
                .clipShape(Capsule())
            }
        } else {
            ZStack {
                Button {
                    withAnimation(.spring()) {
                        selectedTab = config.tag
                    }
                } label: {
                    HStack {
                        config.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.black)
                        if selectedTab == config.tag {
                            Text(config.name)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                    }
                }
                Spacer()
            }
            .opacity(selectedTab == config.tag ? 1 : 0.5)
            .padding(.horizontal, 7)
            .padding(.vertical, 7)
            .background(selectedTab == config.tag ? Color.white : Color.gray)
            .clipShape(Capsule())
        }
    }
}

struct DetailView_Provider: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
