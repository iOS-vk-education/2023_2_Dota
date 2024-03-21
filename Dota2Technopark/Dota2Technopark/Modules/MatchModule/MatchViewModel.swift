//
//  MatchViewModel.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 13.03.2024.
//

import Foundation
import Combine
import SwiftUI

class MatchViewModel: ObservableObject {
    
    @Published var match: MatchModel?
    private var cancelable: AnyCancellable?
    private let matchService = MatchService()
    
    init() {
        fetchMatch()
    }
    
    private func fetchMatch() {
        cancelable = matchService.fetchMatch(by: 7571425597)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] match in
                self?.match = match
            })
    }
}
