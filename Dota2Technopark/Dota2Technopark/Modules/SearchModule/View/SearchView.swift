//
//  SearchView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import UIKit
import SteamLogin

final class SearchView: UIViewController {
    var output: SearchViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

extension SearchView: SearchViewInput {
    
}
