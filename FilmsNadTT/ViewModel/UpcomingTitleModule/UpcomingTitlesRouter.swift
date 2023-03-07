//
//  UpcomingTitlesRouter.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/3/23.
//

import UIKit

class UpcomingTitlesRouter: Router {
    
    //MARK: Properties
    
    private let assemblyBuilder: AssemblyBuilderProtocol
    private let baseViewController: UIViewController
    
    //MARK: - Initialization
    
    required init(baseViewController: UIViewController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.baseViewController = baseViewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    //MARK: - Methods
    
    func present(module: Module, animated: Bool, context: Any?, completion: (() -> Void)?) {
        let defenitionVC = prepareModule(module, context: context)
        defenitionVC.modalPresentationStyle = .fullScreen
        baseViewController.present(defenitionVC, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {}
    
    //MARK: - Private methods
    
    private func prepareModule(_ module: Module, context: Any?) -> UIViewController {
        switch module {
        case .titlePage:
            guard let title = context as? TMDBTitle else {
                fatalError("ERROR: An undefined context has been set for creating the required module")
            }
            return assemblyBuilder.createTitlePageModule(title: title)
        default:
            fatalError("ERROR: Invalid routing module requested")
        }
    }
}
