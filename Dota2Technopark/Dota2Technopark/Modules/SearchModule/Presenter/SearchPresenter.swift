//
//  SearchPresenter.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation

final class SearchPresenter {
    weak var view: SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?
    
    var router: SearchRouterInput?
    var interactor: SearchInteractorInput?
}

extension SearchPresenter: SearchViewOutput {
    
}

extension SearchPresenter: SearchInteractorOutput {
    
}

