//
//  AuthAssembly.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import Foundation

final class AuthAssembly {
    private var view = AuthView()
    private let presenter = AuthPresenter()
    private let router = AuthRouter()
    
    // MARK: - Public method
    
    func assembleModule(
        moduleOutput: AuthModuleOutput?,
        transition: ((AuthRouterInput) -> Void)?,
        completion: ((AuthModuleInput) -> Void)?
    ) {
        configureDependenciesWithModuleOutput(moduleOutput: moduleOutput)
        
        if let transition {
            transition(router)
        }
    }
    
    // MARK: - Private method
    
    private func configureDependenciesWithModuleOutput(moduleOutput: AuthModuleOutput?) {
        presenter.view = view
        view.output = presenter
        
        presenter.router = router
        router.view = view
        
        presenter.moduleOutput = moduleOutput
    }
}
