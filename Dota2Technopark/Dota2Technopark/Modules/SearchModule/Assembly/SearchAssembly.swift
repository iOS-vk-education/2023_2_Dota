//
//  SearchAssembly.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation

final class SearchAssembly {
    
    private var view = SearchView()
    private var presenter = SearchPresenter()
    private var router = SearchRouter()
    private var interactor = SearchInteractor()
    
    
    // MARK: - Public method
    
    func assembleModule(
        moduleOutput: SearchModuleOutput,
        transition: ((SearchRouterInput) -> Void)?,
        completion: ((SearchModuleInput) -> Void)?
    ) {
        configureDependenciesWithModuleOutput(moduleOutput: moduleOutput)
        
        if let transition {
            transition(router)
        }
    }
    
    // MARK: - Configure dependencies
    
    private func configureDependenciesWithModuleOutput(moduleOutput: SearchModuleOutput) {
        presenter.view = view
        view.output = presenter
        
        presenter.router = router
        router.view = view
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        presenter.moduleOutput = moduleOutput
    }
}

