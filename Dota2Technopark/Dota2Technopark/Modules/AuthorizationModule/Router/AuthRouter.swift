//
//  AuthRouter.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation

final class AuthRouter: BaseSwiftRouter {
    
}

extension AuthRouter: AuthRouterInput {
    func openTabBarView() {
        let tabScene = SteamTabBarController()
        
        tabScene.modalPresentationStyle = .fullScreen
        self.view?.present(tabScene, animated: true)
    }
}
