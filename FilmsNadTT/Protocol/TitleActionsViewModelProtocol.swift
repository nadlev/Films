//
//  TitleActionsViewModelProtocol.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/2/23.
//

import Foundation

protocol TitleActionsViewModelProtocol {
    func isTitleInStorage(at indexPath: IndexPath) -> Bool
    func learnMoreAboutTitle(at indexPath: IndexPath)
    func deleteBookmark(at indexPath: IndexPath)
    func addBookmarkForTitle(at indexPath: IndexPath)
}
