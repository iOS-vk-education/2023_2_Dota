//
//  SegmentedControl.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 13.03.2024.
//

import SwiftUI

struct SegmentedControl<Indicator: View>: View {
    var tabs: [SegmentedTab]
    @Binding var activeTab: SegmentedTab
    @Binding var swipeDetected: Bool
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
            let containerWidthForEachTab = (size.width / CGFloat(tabs.count))
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
                        changeTab(to: tab, containerWidthForEachTab: containerWidthForEachTab)
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
                // можно попробовать .onRecieve с Combine
                .onChange(of: activeTab) {
                    if swipeDetected {
                        changeTab(to: activeTab, containerWidthForEachTab: containerWidthForEachTab)
                        swipeDetected = false
                    }
                }
        }
    }
    .frame(height: height)
}
    
    func changeTab(to tab: SegmentedTab, containerWidthForEachTab: CGFloat) {
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
    
}

enum SegmentedTab: String, CaseIterable {
    case first = "trophy.fill"
    case second = "heart.fill"
}
