//
//  HomePageViewController.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/2/23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    var viewModel: HomePageViewModelProtocol!
    
    // MARK: - VIEW
    
    private lazy var titlesCollectionTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private lazy var headerView: UIView = {
        let someView = TitleHeaderView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height * 0.62
            )
        )
        someView.viewModel = self.viewModel.viewModelForHeaderCoverView()
        return someView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
