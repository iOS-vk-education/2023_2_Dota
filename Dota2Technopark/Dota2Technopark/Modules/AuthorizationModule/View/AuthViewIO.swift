//
//  AuthViewIO.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation
import SteamLogin

protocol AuthViewInput: AnyObject {
    func performUser(steamUser: SteamUser?)
}

protocol AuthViewOutput {
    func getSteamUser()
}
