//
//  ApiTest.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 13.03.2024.
//

import SwiftUI

struct ApiTest: View {
    //View Model
    @ObservedObject private var viewModel: MatchViewModel
    init(viewModel: MatchViewModel = MatchViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View{
        Text(String(viewModel.match?.match_id ?? 123))
        Text(String(viewModel.match?.barracks_status_dire ?? 123))
        Text(String(viewModel.match?.barracks_status_radiant ?? 123))
    }
}

#Preview {
    ApiTest()
}
