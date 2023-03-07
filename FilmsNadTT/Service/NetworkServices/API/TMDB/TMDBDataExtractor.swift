//
//  TMDBDataExtractor.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/2/23.
//

import Foundation

class TMDBDataExtractor {
    private let apiManager: TMDBAPIManager
    
    init(apiKey: String) {
        apiManager = TMDBAPIManager(apiKey: apiKey)
    }
    
    //MARK: - Methods
    
    func fetchTitles(category: TitlesCategory, completion: @escaping ([TMDBTitle]?) -> Void) {
        apiManager.getTitles(category: category) { data, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let titlesResult = self.decodeJSON(type: TitlesResult.self, from: data)
            completion(titlesResult?.results)

        }
    }
    
    func searchTitles(query: String, completion: @escaping ([TMDBTitle]?) -> Void) {
        apiManager.searchTitles(query: query) { data, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let titlesResult = self.decodeJSON(type: TitlesResult.self, from: data)
            completion(titlesResult?.results)
        }
    }
    
    func fetchImageData(from url: String, completion: @escaping (Data?) -> Void) {
        apiManager.fetchImage(from: url) { imageURL in
            NetworkDataManager.shared.fetchData(from: "\(imageURL)\(url)", completion: completion)
        }
    }
    
    //MARK: - Private methods
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        guard let data = data else { return nil }

        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch let decodeError {
            print(decodeError)
            return nil
        }
    }
}
