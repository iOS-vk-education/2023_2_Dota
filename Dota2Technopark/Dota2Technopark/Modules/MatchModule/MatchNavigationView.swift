//
//  SegmentedController.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 11.03.2024.
//

import SwiftUI
import Combine

struct NavigationTabView: View {
    //View Model
    @ObservedObject private var viewModel: MatchViewModel
    init(viewModel: MatchViewModel = MatchViewModel()) {
        self.viewModel = viewModel
        self.tabs = [.first, .second]
    }
    
    //View Properties
    @State private var activeTab: SegmentedTab = .first
    @State private var type2: Bool = false
    @State private var swipeDetected: Bool = false
    var tabs: [SegmentedTab]
    
    var body: some View {
        VStack(spacing: 0){
            MatchHeaderView()
            SegmentedControl(
                tabs: SegmentedTab.allCases,
                activeTab: $activeTab, 
                swipeDetected: $swipeDetected,
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
                MatchContentView(type2: $type2)
            case .second:
                //для теста
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: -10) {
                        ForEach(0 ..< 10) { i in
                            MainListCellView()
                        }
                    }
                }
            }
            Spacer(minLength: 0)
                
        }
        .padding(.vertical, type2 ? 15 : 0)
        .animation(.snappy, value: type2)
        .ignoresSafeArea(.container, edges: .bottom)
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width > 0 {
                        $activeTab.wrappedValue = .first
                        swipeDetected = true
                    }
                    if value.translation.width < 0 {
                        $activeTab.wrappedValue = .second
                        swipeDetected = true
                    }
                })
        )
    }
}

#Preview(){
    NavigationTabView()
}

