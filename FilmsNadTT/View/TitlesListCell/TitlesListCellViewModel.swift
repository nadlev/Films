//
//  TitlesListCellViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/3/23.
//

import Foundation

//MARK: - TitlesListCellViewModelProtocol

protocol TitlesListCellViewModelProtocol {
    var titleId: Int { get }
    func fetchPoster(completion: @escaping(Data?) -> Void)
}

// MARK: - TitlesListCellViewModel

class TitlesListCellViewModel: TitlesListCellViewModelProtocol {
    
    //properties
    var titleId: Int {
        title.id
    }
    
    private let title: TMDBTitle
    private let apiDataExtractor: TMDBDataExtractor
    
    //init
    init(title: TMDBTitle, apiKey: String) {
        self.title = title
        self.apiDataExtractor = TMDBDataExtractor(apiKey: apiKey)
    }
    
    //methods
    
    func fetchPoster(completion: @escaping (Data?) -> Void) {
        apiDataExtractor.fetchImageData(from: title.posterPath ?? "", completion: completion)
    }
}
