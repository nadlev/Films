//
//  TitleSearchResultViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import Foundation

protocol TitlesSearchResultViewModelProtocol: TitleActionsViewModelProtocol {
    var resultCount: Int { get }
    func idForTitle(at indexPath: IndexPath) -> Int
    func viewModelForCell(at indexPath: IndexPath) -> TitlePreviewCellViewModelProtocol
    func showTitlePageForCell(at indexPath: IndexPath)
    func clearResult()
}

class TitleSearchResultViewModel: TitlesSearchResultViewModelProtocol {
    
    var resultCount: Int {
        titles.count
    }
    
    weak var delegate: SearchViewModelDelegate?
    
    private var titles: [TMDBTitle]
    private let apiKey: String
    private let storeManager = StorageManager()
    
    init(titles: [TMDBTitle], apiKey: String) {
        self.titles = titles
        self.apiKey = apiKey
    }
    
    func idForTitle(at indexPath: IndexPath) -> Int {
        titles[indexPath.row].id
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> TitlePreviewCellViewModelProtocol {
        TitlePreviewCellViewModel(title: titles[indexPath.row], apiKey: self.apiKey)
    }
    
    func showTitlePageForCell(at indexPath: IndexPath) {
        delegate?.showTitlePage(with: titles[indexPath.row])
    }
    
    func clearResult() {
        titles = []
    }
}

extension TitleSearchResultViewModel: TitleActionsViewModelProtocol {
    func isTitleInStorage(at indexPath: IndexPath) -> Bool {
        storeManager.isInStorage(titles[indexPath.row])
    }
    
    func deleteBookmark(at indexPath: IndexPath) {
        storeManager.delete(titles[indexPath.row])
    }
    
    func addBookmarkForTitle(at indexPath: IndexPath) {
        storeManager.save(titles[indexPath.row])
    }
    
    func learnMoreAboutTitle(at indexPath: IndexPath) {
        showTitlePageForCell(at: indexPath)
    }
}
