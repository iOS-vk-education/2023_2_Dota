//
//  SegmentedController.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 11.03.2024.
//

import SwiftUI

struct SegmentedControl<Indicator: View>: View {
    var tabs: [SegmentedTab]
    @Binding var activeTab: SegmentedTab
    var height: CGFloat = 45
    //Customization Properties
    var displayAsText: Bool = false
    var font: Font = .title3
    var activeTint: Color
    var inActiveTint: Color
    //Indicator View
    @ViewBuilder var indicatorView: (CGSize) -> Indicator
    //View Properties
    @State private var excessTabWidth: CGFloat = .zero
    @State private var minX: CGFloat = .zero
    var body: some View {
        GeometryReader{
            let size = $0.size
            let containerWidthForEachTab = size.width / CGFloat(tabs.count)
            HStack(spacing: 0){
                ForEach(tabs, id: \.rawValue) { tab in
                    Group{
                        if displayAsText {
                            Text(tab.rawValue)
                        } else {
                            Image(systemName: tab.rawValue)
                        }
                    }
                    .font(font)
                    .foregroundStyle(activeTab == tab ? activeTint : inActiveTint)
                    .animation(.snappy, value: activeTab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        if let index = tabs.firstIndex(of: tab), let activeIndex = tabs.firstIndex(of: activeTab){
                            activeTab = tab
                            
                            withAnimation(.snappy(duration: 0.25, extraBounce: 0), completionCriteria: .logicallyComplete){
                                excessTabWidth = containerWidthForEachTab * CGFloat(index - activeIndex)
                            } completion: {
                                withAnimation(.snappy(duration: 0.25, extraBounce: 0)){
                                    minX = containerWidthForEachTab * CGFloat(index)
                                    excessTabWidth = 0
                                }
                            }
                        }
                    }
                    .background(alignment: .leading) {
                        if tabs.first == tab {
                            GeometryReader {
                                let size = $0.size
                                
                                indicatorView(size)
                                    .frame(width: size.width + (excessTabWidth < 0 ? -excessTabWidth : excessTabWidth), height: size.height)
                                    .frame(width: size.width, alignment: excessTabWidth < 0 ? .trailing : .leading)
                                    .offset(x: minX)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: height)
    }
}

struct SegmentedTabView: View {
    //View Properties
    @State private var activeTab: SegmentedTab = .first
    @State private var type2: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                SegmentedControl(
                    tabs: SegmentedTab.allCases,
                    activeTab: $activeTab,
                    height: 35,
                    font: .body,
                    activeTint: type2 ? .white : .primary,
                    inActiveTint: .gray.opacity(0.5))
                { size in
                    RoundedRectangle(cornerRadius: type2 ? 30 : 0)
                        .fill(.black.gradient)
                        .frame(height: type2 ? size.height : 4)
                        .padding(.horizontal, type2 ? 0 : 10)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .padding(.top, type2 ? 0 : 10)
                .background {
                    RoundedRectangle(cornerRadius: type2 ? 30 : 0)
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                }
                .padding(.horizontal, type2 ? 15 : 0)
                
                //switch for navigation
                switch activeTab {
                    case .first:
                        MatchContentView()
                    case .second:
                        Text("Содержимое для вкладки Избранное")
                    case .third:
                        Text("Содержимое для вкладки Звонок")
                }
                Spacer(minLength: 0)
            }
            .padding(.vertical, type2 ? 15 : 0)
            .animation(.snappy, value: type2)
        }
    }
}

enum SegmentedTab: String, CaseIterable {
    case first = "trophy.fill"
    case second = "heart.fill"
    case third = "bell.fill"
}



#Preview(){
    SegmentedTabView()
}

