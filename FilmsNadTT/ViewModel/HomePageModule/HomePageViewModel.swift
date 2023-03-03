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
    func viewModelForCell(at section: Int) -> TitlesGroupCellViewModelProtocol
    func viewModelForHeaderCoverView() -> TitlesHeaderViewViewModel
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
    
    func viewModelForCell(at section: Int) -> TitlesGroupCellViewModelProtocol {
        let category = setupCategory(for: section)
        return setupTitleGroupCellViewModel(with: category)
    }
    
    func viewModelForHeaderCoverView() -> TitlesHeaderViewViewModel {
        let viewModel = TitlesHeaderViewViewModel()
        viewModel.delegate = self
        return viewModel
    }
    
    func goToSearch() {
        router.present(module: .search, animated: true, context: nil, completion: nil)
    }
    
    private func setupCategory(for section: Int) -> TitlesCategory {
        guard let titlesSection = TitlesSection(rawValue: section) else {
            return .popularTVs
        }
        return titlesSection.category
    }
    
    private func setupTitleGroupCellViewModel(with category: TitlesCategory) -> TitlesGroupCellViewModel {
        let viewModel = TitlesGroupCellViewModel(titlesCategory: category)
        viewModel.delegate = self
        return viewModel
    }
}

extension HomePageViewModel: ViewModelRouteDelegate {
    func showTitlePage(with title: TMDBTitle) {
        router.present(module: .titlePage, animated: true, context: title, completion: nil)
    }
}
