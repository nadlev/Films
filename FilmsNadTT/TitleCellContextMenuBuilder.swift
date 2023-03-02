//
//  TitleCellContextMenuBuilder.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/6/23.
//

import UIKit

struct TitleCellContextMenuBuilder {
    
    // MARK: - PROPERTIES
    
    private let viewModel: TitleActionsViewModelProtocol
    private let actionsBuilder = TitleCellActionsBuilder()
    
    //MARK: - INIT
    
    init(viewModel: TitleActionsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    //MARK: - METHODS
    
    func configureContextMenuForCell(at indexPath: IndexPath) -> UIContextMenuConfiguration {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return UIMenu(title: "")
        }
    }
    
    // MARK: - PRIV METHODS
    
    private func setupActionsForCell(at indexPath: IndexPath) -> [UIAction] {
        let bookmarksAction = setupBookmarksAction(indexPath)
        let learnMoreAction = setupLearnMoreAction(indexPath)
        return [bookmarksAction, learnMoreAction]
    }
    
    private func setupLearnMoreAction(_ indexPath: IndexPath) -> UIAction {
        return actionsBuilder.createLearnMoreAction {
            viewModel.learnMoreAboutTitle(at: indexPath)
        }
    }
    
    private func setupBookmarksAction(_ indexPath: IndexPath) -> UIAction {
        if viewModel.isTitleInStorage(at: indexPath) {
            return actionsBuilder.createDeleteAction {
                viewModel.deleteBookmark(at: indexPath)
            }
        } else {
            return actionsBuilder.createAddToBookmarksAction {
                viewModel.addBookmarkForTitle(at: indexPath)
            }
        }
    }
    
}
