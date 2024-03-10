//
//  AuthPresenter.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation
import SteamLogin

final class AuthPresenter {
    weak var view: AuthViewInput?
    weak var moduleOutput: AuthModuleOutput?
    
    var router: AuthRouterInput?
    
    var steamUser: SteamUser? = nil
    let steamApiKey: String = "160A1E87653E30D9562DE9E5A47386E5"
}

extension AuthPresenter: AuthViewOutput {
    func getSteamUser() {
        SteamLogin.steamApiKey = steamApiKey
        self.steamUser = SteamUser.load()
        view?.performUser(steamUser: steamUser)
    }
}
