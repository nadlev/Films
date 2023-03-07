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
        let view = HomePageViewController()
        let router = HomePageRouter(baseViewController: view, assemblyBuilder: self)
        let homePageViewModel = HomePageViewModel(router: router)
        view.viewModel = homePageViewModel
        return view
    }
    
    func createSearchModule() -> UIViewController {
        let view = SearchViewController()
        let router = SearchRouter(baseViewController: view, assemblyBuilder: self)
        let searchViewModel = SearchViewModel(router: router)
        view.viewModel = searchViewModel
        return UINavigationController(rootViewController: view)
    }
    
    func createTitlePageModule(title: TMDBTitle) -> UIViewController {
        let view = TitlePageViewController()
        let router = TitlePageRouter(baseViewController: view, assemblyBuilder: self)
        let titlePageViewModel = TitlePageViewModel(title: title, router: router)
        view.viewModel = titlePageViewModel
        return view
    }
    
    func createUpcomingTitlesModule() -> UIViewController {
        let view = UpcomingTitlesViewController()
        let router = UpcomingTitlesRouter(baseViewController: view, assemblyBuilder: self)
        let upcomingTitlesViewModel = UpcomingTitlesViewModel(router: router)
        view.viewModel = upcomingTitlesViewModel
        return view
    }
    
    
    func createBookmarksModule() -> UIViewController {
        let view = BookmarksViewController()
        let router = BookmarksRouter(baseViewController: view, assemblyBuilder: self)
        let bookmarksViewModel = BookmarksViewModel(router: router)
        view.viewModel = bookmarksViewModel
        return view
    }
}
