//
//  DragHelper.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 12.03.2024.
//

import SwiftUI

extension View {
    func matchDragGesture(activeTab: Binding<SegmentedTab>) -> some View {
        self.gesture(
            DragGesture()
                .onEnded({ value in
                    // Определяем направление жеста и изменяем значение activeTab
                    if value.translation.width > 0 {
                        activeTab.wrappedValue = .first
                    }
                    if value.translation.width < 0 {
                        activeTab.wrappedValue = .second
                    }
                })
        )
    }
}
