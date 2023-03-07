//
//  MainTabBarControllerViewController.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/3/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let assemblyBuilder = AssemblyBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tabBar
            .tintColor = UIColor(named: "AccentColor")
        
        viewControllers = [
            createNavigationController(rootVC: assemblyBuilder.createHomePageModule(),  tabBarTitle: "Home",
                tabBarImage: UIImage(systemName: "popcorn"),
                tabBarSelectedImage: UIImage(systemName: "popcorn.fill")
                ),
            createNavigationController(rootVC: assemblyBuilder.createUpcomingTitlesModule(),
                                       tabBarTitle: "Upcoming",
                                       tabBarImage: UIImage(systemName: "play.circle"),
                                      tabBarSelectedImage: UIImage(systemName: "play.circle.fill")
                                      ),
            createNavigationController(rootVC: assemblyBuilder.createBookmarksModule(),
                                       tabBarTitle: "Bookmarks", tabBarImage: UIImage(systemName: "heart.circle"),
                                      tabBarSelectedImage: UIImage(systemName: "heart.circle.fill"))
            
        ]

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func createNavigationController(rootVC: UIViewController, tabBarTitle: String, tabBarImage: UIImage?, tabBarSelectedImage: UIImage? = nil) -> UIViewController {
        let viewController = UINavigationController(rootViewController: rootVC)
        viewController.tabBarItem.image = tabBarImage
        viewController.tabBarItem.selectedImage = tabBarSelectedImage
        viewController.tabBarItem.title = tabBarTitle
        viewController.navigationBar.tintColor = .label
        return viewController
    }

}
