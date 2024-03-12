//
//  SearchView.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import UIKit

final class SearchView: UIViewController {
    var output: SearchViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = SearchNetworkService()
        
        a.searchForQuery("Not") { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension SearchView: SearchViewInput {
    
}
