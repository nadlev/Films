//
//  TitlePreviewCellViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import Foundation

protocol TitlePreviewCellViewModelProtocol {
    var titleID: Int? { get }
    var titleName: String { get }
    var overview: String { get }
    var voteAverage: Double? { get }
    func fetchPosterImage(completion: @escaping (Data?) -> Void)
}

class TitlePreviewCellViewModel: TitlePreviewCellViewModelProtocol {
    
    private let title: TMDBTitle
    private let apiDataExtractor: TMDBDataExtractor
    
    var titleID: Int? {
        title.id
    }
    
    var titleName: String {
        (title.name ?? title.originalName ?? title.originalTitle) ?? ""
    }
    
    var overview: String {
        title.overview ?? ""
    }
    
    var voteAverage: Double? {
        title.voteAverage
    }
    
    init(title: TMDBTitle, apiKey: String) {
        self.title = title
        apiDataExtractor = TMDBDataExtractor(apiKey: apiKey)
    }
    
    func fetchPosterImage(completion: @escaping (Data?) -> Void) {
        guard let url = title.posterPath else { return }
        apiDataExtractor.fetchImageData(from: url, completion: completion)
    }
}
