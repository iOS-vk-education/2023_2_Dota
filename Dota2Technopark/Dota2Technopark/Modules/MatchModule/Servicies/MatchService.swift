//
//  MatchService.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 13.03.2024.
//


//https://api.opendota.com/api/matches/{match_id}
//https://api.opendota.com/api/matches/7603911812
//match_id for mock - 7603911812

import Alamofire
import Combine

class MatchService {
    let base_url = "https://api.opendota.com/api/matches/"
    
    func fetchMatch(by matchId: Int) -> AnyPublisher<MatchModel, AFError> {
        let publisher = AF.request(base_url + "\(matchId)").publishDecodable(type: MatchModel.self)
        return publisher.value()
    }
}
