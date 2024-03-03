//
//  SteamTabBarController.swift
//  SteamTabBarController
//
//  Created by Mike Ulanov on 19.02.2024.
//

import UIKit
import SwiftUI
import SteamLogin
import SnapKit

final class SUITabBarController: UIHostingController<ContentView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())
    }
}

final class SteamTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coder = NSKeyedUnarchiver(forReadingWith: Data())
        
        guard let swiftUITabBarController = SUITabBarController(coder: coder) else { return }
        
        addChild(swiftUITabBarController)
        view.addSubview(swiftUITabBarController.view)
        swiftUITabBarController.view.frame = view.bounds
        swiftUITabBarController.didMove(toParent: self)
    }
}

