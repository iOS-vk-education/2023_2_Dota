//
//  AppIntent.swift
//  Dota2Widget
//
//  Created by Mike Ulanov on 19.02.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "DotaTracker"
    static var description = IntentDescription("DotaTracker with match analytics for dota players.")

    @Parameter(title: "mmrValue", default: 4280)
    var mmrValue: Int
}
