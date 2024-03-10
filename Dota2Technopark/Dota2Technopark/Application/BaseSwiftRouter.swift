//
//  BaseSwiftRouter.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 10.03.2024.
//

import UIKit

protocol BaseSwiftRouterInput {
    
    func openModuleFromWindow(window: UIWindow?)
    func openModuleFromViewController(sourseView: UIViewController)
    func closeModule()
}

class BaseSwiftRouter: BaseSwiftRouterInput {
    
    weak var view: UIViewController?
    
    func openModuleFromWindow(window: UIWindow?) {
        guard let window = window else { return }
        let navigationController = UINavigationController(rootViewController: self.view!)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func openModuleFromViewController(sourseView: UIViewController) {
    }
    
    func closeModule() {
    }
}
