//
//  AssemblyBuilder.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 1/30/23.
//

import UIKit

enum Module {
    case home
    case titlePage
    case search
    case upcoming
    case bookmarks
}

// MARK: - AsemblyBuilderProtocol

protocol AssemblyBuilderProtocol {
    func createHomePageModule() -> UIViewController
    func createSearchModule() -> UIViewController
    func createTitlePageModule(title: TMDBTitle) -> UIViewController
    func createUpcomingTitlesModule() -> UIViewController
    func createBookmarksModule() -> UIViewController
}

// MARK: - AssemblyBuilder

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createHomePageModule() -> UIViewController {
        let view = 
    }
}
