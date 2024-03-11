//
//  test.swift
//  Dota2Technopark
//
//  Created by Кирилл Давыденков on 11.03.2024.
//

import SwiftUI

        struct test: View {
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


#Preview {
    test()
}
