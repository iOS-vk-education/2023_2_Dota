//
//  Dota2WidgetLiveActivity.swift
//  Dota2Widget
//
//  Created by Mike Ulanov on 19.02.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Dota2WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Dota2WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Dota2WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Dota2WidgetAttributes {
    fileprivate static var preview: Dota2WidgetAttributes {
        Dota2WidgetAttributes(name: "World")
    }
}

extension Dota2WidgetAttributes.ContentState {
    fileprivate static var smiley: Dota2WidgetAttributes.ContentState {
        Dota2WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Dota2WidgetAttributes.ContentState {
         Dota2WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Dota2WidgetAttributes.preview) {
   Dota2WidgetLiveActivity()
} contentStates: {
    Dota2WidgetAttributes.ContentState.smiley
    Dota2WidgetAttributes.ContentState.starEyes
}
