//
//  URLs.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 12.03.2024.
//

import Foundation

enum OpenDotaURL: String {
    case base = "https://api.opendota.com/api"
  
    var accountEP: String { // + accointID - SteamID32
        self.rawValue + "/players/"
    }
    
    var searchPlayersEP: String {
        self.rawValue + "/search"
    }
}
