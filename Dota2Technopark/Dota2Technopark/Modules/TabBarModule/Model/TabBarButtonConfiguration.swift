//
//  TabBarButtonConfiguration.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 04.03.2024.
//

import SwiftUI

enum TabState {
    case search
    case main
    case settings
}

struct TabBarButtonConfiguration: Hashable {
    let name: String
    let image: Image
    let tag: TabState
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(tag)
    }
    
    static func == (lhs: TabBarButtonConfiguration, rhs: TabBarButtonConfiguration) -> Bool {
        return lhs.name == rhs.name && lhs.tag == rhs.tag
    }
}
