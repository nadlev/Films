//
//  Router.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 1/30/23.
//

import UIKit

protocol Router {
    
    init(baseViewController: UIViewController, assemblyBuilder: AssemblyBuilderProtocol)
    
    func present(module: Module, animated: Bool, context: Any?, completion: (() -> Void)?)
    
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
