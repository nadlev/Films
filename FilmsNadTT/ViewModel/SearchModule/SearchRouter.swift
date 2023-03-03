//
//  SearchRouter.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import UIKit

class SearchRouter: Router {
    
    private let assemblyBuilder: AssemblyBuilderProtocol
    private let baseViewController: UIViewController
    
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
        baseViewController.dismiss(animated: animated, completion: completion)
    }
    
    private func prepareModule(_ module: Module, context: Any?) -> UIViewController {
        switch module {
        case .titlePage:
            guard let title = context as? TMDBTitle else {
                fatalError("Error")
            }
            return assemblyBuilder.createTitlePageModule(title: title)
        default:
            fatalError("Error")
        }
    }
}
