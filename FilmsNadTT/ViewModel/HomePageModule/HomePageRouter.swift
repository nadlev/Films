//
//  HomePageRouter.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 1/30/23.
//

import UIKit

class HomePageRouter: Router {

    // MARK: - PROPERTIES
    
    private let assemblyBuilder: AssemblyBuilderProtocol
    private let baseViewController: UIViewController
    
    // MARK: - INIT
    
    required init(baseViewController: UIViewController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.baseViewController = baseViewController
        self.assemblyBuilder = assemblyBuilder
    }
   
    func present(module: Module, animated: Bool, context: Any?, completion: (() -> Void)?) {
        let definitionVC = prepareModule(module, context: context)
        definitionVC.modalPresentationStyle = .fullScreen
        baseViewController.present(definitionVC, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
    }
    
    private func prepareModule(_ module: Module, context: Any?) -> UIViewController {
        switch module {
        case .titlePage:
            guard let title = context as? TMDBTitle else {
                return UIViewController()
            }
            return assemblyBuilder.createTitlePageModule(title: title)
            
        case .search:
            return assemblyBuilder.createSearchModule()
        default:
            fatalError("Error: Invalid routing module requested")
        
        }
    }
    
}
