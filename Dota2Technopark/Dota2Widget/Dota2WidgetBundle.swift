//
//  Dota2WidgetBundle.swift
//  Dota2Widget
//
//  Created by Mike Ulanov on 19.02.2024.
//

import WidgetKit
import SwiftUI

@main
struct Dota2WidgetBundle: WidgetBundle {
    var body: some Widget {
        Dota2Widget()
        Dota2WidgetLiveActivity()
    }
}
