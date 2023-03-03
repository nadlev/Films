//
//  TitlePageRouter.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import UIKit

class TitlePageRouter: Router {
    
    private let assemblyBuilder: AssemblyBuilderProtocol
    private let baseViewController: UIViewController
    
    required init(baseViewController: UIViewController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.baseViewController = baseViewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func present(module: Module, animated: Bool, context: Any?, completion: (() -> Void)?) {
        
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        baseViewController.dismiss(animated: true)
    }
}
