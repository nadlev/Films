//
//  TitlePageViewModel.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/2/23.
//

import Foundation

protocol TitlePageViewModelProtocol {
    var titleName: String { get }
    var overview: String { get }
    var voteAverage: Double? { get }
    var isFavourite: Bool { get }
    var viewModelDidChange: ((TitlePageViewModelProtocol) -> Void)? { get set }
    func fetchPosterImage(completion: @escaping(Data?) -> Void)
    func fetchTitleTrailer(completion: @escaping (URL) -> Void)
    func toggleFavouriteStatus()
    func closeTitlePage()
}

class TitlePageViewModel: TitlePageViewModelProtocol {
    
    private let router: Router
    private let title: TMDBTitle
    private let apiKeyManager = APIKeyManager()
    private lazy var tmdbDataExtractor = TMDBDataExtractor(apiKey: apiKeyManager.getAPIKey(type: .TMDB) ?? "" )
    private lazy var youTubeDataExtractor = YouTubeDataExtractor(apiKey: apiKeyManager.getAPIKey(type: .YouTube) ?? "" )
    private let videoExtractor = YouTubeVideoExtractor()
    private let storageManager = StorageManager()
    
    var titleName: String {
        (title.name ?? title.originalName ?? title.originalTitle) ?? ""
    }
    
    var overview: String {
        title.overview ?? ""
    }
    
    var voteAverage: Double? {
        title.voteAverage
    }
    
    var isFavourite: Bool {
        get {
            storageManager.isInStorage(title)
        }
        
        set {
            if newValue {
                storageManager.save(title)
            } else {
                storageManager.delete(title)
            }
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((TitlePageViewModelProtocol) -> Void)?
    
    init(title: TMDBTitle, router: Router) {
        self.title = title
        self.router = router
    }
    
    func fetchPosterImage(completion: @escaping (Data?) -> Void) {
        guard let posterStringUrl = title.posterPath else { return }
        tmdbDataExtractor.fetchImageData(from: posterStringUrl) { imageData in
            completion(imageData)
        }
    }
    
    func fetchTitleTrailer(completion: @escaping (URL) -> Void) {
        let query = "\(titleName) official trailer"
        youTubeDataExtractor.searchVideo(query: query) { [weak self] videoComponents in
            guard let videoID = videoComponents?.id?.videoId else {
                print("Error, unable to find video")
                return
            }
            self?.videoExtractor.fetchVideo(id: videoID, completion: completion)
        }
    }
    
    func toggleFavouriteStatus() {
        isFavourite.toggle()
    }
    
    func closeTitlePage() {
        router.dismiss(animated: true, completion: nil)
    }
}
