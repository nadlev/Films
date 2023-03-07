//
//  UpcomingTitlesViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/3/23.
//

import Foundation

protocol UpcomingTitlesViewModelProtocol:TitleActionsViewModelProtocol {
    var numberOfTitles: Int { get }
    func fetchTitles(complation: @escaping () -> Void)
    func idForTitle(at indexPath: IndexPath) -> Int
    func viewModelForCell(at indexPath: IndexPath) -> TitlePreviewCellViewModelProtocol
    func showTitlePageForCell(at indexPath: IndexPath)
}

class UpcomingTitlesViewModel: UpcomingTitlesViewModelProtocol {
    
    private var titles: [TMDBTitle] = []
    private let apiKeyManager = APIKeyManager()
    private lazy var apiKey = apiKeyManager.getAPIKey(type: .TMDB) ?? ""
    private lazy var dataExtractor = TMDBDataExtractor(apiKey: self.apiKey)
    private let storageManager = StorageManager()
    private let router: Router
    
    var numberOfTitles: Int {
        titles.count
    }
    
    init(router: Router) {
        self.router = router
    }
    
    func fetchTitles(complation: @escaping () -> Void) {
        dataExtractor.fetchTitles(category: .upcomingMovies) { [weak self] fetchedTitles in
            guard let fetchedTitles = fetchedTitles else { return }
            self?.titles = fetchedTitles
            complation()
        }
    }
    
    func idForTitle(at indexPath: IndexPath) -> Int {
        titles[indexPath.row].id
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> TitlePreviewCellViewModelProtocol {
        TitlePreviewCellViewModel(title: titles[indexPath.row], apiKey: self.apiKey)
    }
    
    func showTitlePageForCell(at indexPath: IndexPath) {
        router.present(module: .titlePage, animated: true, context: titles[indexPath.row], completion: nil)
    }
    
}

extension UpcomingTitlesViewModel: TitleActionsViewModelProtocol {
    func isTitleInStorage(at indexPath: IndexPath) -> Bool {
        storageManager.isInStorage(titles[indexPath.row])
    }
    
    func deleteBookmark(at indexPath: IndexPath) {
        storageManager.delete(titles[indexPath.row])
    }
    
    func addBookmarkForTitle(at indexPath: IndexPath) {
        storageManager.save(titles[indexPath.row])
    }
    
    func learnMoreAboutTitle(at indexPath: IndexPath) {
        router.present(module: .titlePage, animated: true, context: titles[indexPath.row], completion: nil)
    }
}
