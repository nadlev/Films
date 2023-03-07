//
//  TitleCellActionsBuilder.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/6/23.
//

import UIKit

struct TitleCellActionsBuilder {
    func createDeleteAction(performedAction: @escaping() -> Void) -> UIAction {
        UIAction(title: "Delete bookmark", image: UIImage(systemName: "heart.slash"), attributes: .destructive) { _ in
            performedAction()
        }
    }
    
    func createAddToBookmarksAction(performedAction: @escaping() -> Void) -> UIAction {
        UIAction(title: "Add to bookmarks",image: UIImage(systemName: "heart.circle")) { _ in
            performedAction()
        }
    }
    
    func createLearnMoreAction(performedAction: @escaping() -> Void) -> UIAction {
        UIAction(title: "Learn more", image: UIImage(systemName: "ellipsis.circle")) { _ in
            performedAction()
        }
    }
}
