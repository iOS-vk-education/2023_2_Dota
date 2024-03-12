//
//  AlamofireNetworkService.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 12.03.2024.
//

import Alamofire

protocol NetworkService {
    func request<T: Codable>(_ url: String, completion: @escaping (Result<T, AFError>) -> Void)
}

class AlamofireNetworkService: NetworkService {
    
    func request<T: Codable>(_ url: String, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(AFError.createURLRequestFailed(error: error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
