//
//  HomePageViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/2/23.
//

import Foundation

// MARK: - HomePageViewModelProtocol

protocol HomePageViewModelProtocol {
    var numberOfSections: Int { get }
    func titleForCell(at index: Int) -> String?
    func viewModelForCell(at section: Int) ->
    func viewModelForHeaderCoverView() ->
    func goToSearch()
}

class HomePageViewModel: HomePageViewModelProtocol {
    
    enum TitlesSection: Int, CaseIterable {
        case popularTVs
        case popularMovies
        case popularAnime
        case popularAnimeMovies
        case trendingTVs
        case trendingMovies
        case topRatedTVs
        case topRatedMovies
        
        var category: TitlesCategory {
            switch self {
            case .popularTVs: return .popularTVs
            case .popularMovies: return .popularMovies
            case .popularAnime: return .popularAnime
            case .popularAnimeMovies: return .popularAnimeMovies
            case .trendingTVs: return .trendingTVs
            case .trendingMovies: return .trendingMovies
            case .topRatedTVs: return .topRatedTVs
            case .topRatedMovies: return .topRatedMovies
            }
        }
    }
    
    // MARK: - PROPERTIES
    
    var numberOfSections: Int {
        TitlesSection.allCases.count
    }
    
    private let router: Router
    
    // MARK: - INIT
    
    init(router: Router) {
        self.router = router
    }
    
    //MARK: - METHODS
    
    func titleForCell(at section: Int) -> String? {
        guard let category = TitlesCategory(rawValue: section) else { return nil }
        return category.name.uppercased()
    }
    
    func viewModelForCell(at section: Int) ->{
        <#code#>
    }
}
