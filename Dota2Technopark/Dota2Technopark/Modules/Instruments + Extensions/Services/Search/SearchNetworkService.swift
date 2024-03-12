//
//  SearchNetworkService.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 12.03.2024.
//

import Alamofire

class SearchNetworkService {
    
    let networkService = AlamofireNetworkService()
    
    func searchForQuery(_ query: String, completion: @escaping (Result<[PlayerRecord], AFError>) -> Void) {
        let url = "https://api.opendota.com/api/search?q=\(query)"
        
        networkService.request(url) { (response: Result<[PlayerRecord], AFError>) in
            completion(response)
        }
    }
}
