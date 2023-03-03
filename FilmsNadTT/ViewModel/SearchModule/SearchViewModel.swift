//
//  SearchViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import Foundation

protocol SearchViewModelProtocol {
    var numberOfResults: Int { get }
    func searchTitle(query: String, completion: @escaping() -> Void)
    func createSearchResultViewModel() -> TitlesSearchResultViewModelProtocol
    func closeSearch()
}

protocol SearchViewModelDelegate: AnyObject {
    func showTitlePage(with title: TMDBTitle)
}

class SearchViewModel: SearchViewModelProtocol, SearchViewModelDelegate {
    
    private var titles: [TMDBTitle] = []
    private lazy var apiKey = APIKeyManager().getAPIKey(type: .TMDB) ?? ""
    private lazy var apiDataExtractor = TMDBDataExtractor(apiKey: apiKey)
    private let router: Router
    
    var numberOfResults: Int {
        titles.count
    }
    
    init(router: Router) {
        self.router = router
    }
    
    func searchTitle(query: String, completion: @escaping () -> Void) {
        apiDataExtractor.searchTitles(query: query) { [weak self] fetchedTitles in
            guard let fetchedTitles = fetchedTitles else { return }
            self?.titles = fetchedTitles
            completion()
        }
    }
    
    func createSearchResultViewModel() -> TitlesSearchResultViewModelProtocol {
        let viewModel = TitleSearchResultViewModel(titles: self.titles, apiKey: self.apiKey)
        viewModel.delegate = self
        return viewModel
    }
    
    func closeSearch() {
        router.dismiss(animated: true, completion: nil)
    }
    
    func showTitlePage(with title: TMDBTitle) {
        router.present(module: .titlePage, animated: true, context: title, completion: nil)
    }
}
