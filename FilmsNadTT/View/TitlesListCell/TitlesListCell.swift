//
//  TitlesListCellCollectionViewCell.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/3/23.
//

import UIKit

class TitlesListCell: UICollectionViewCell {
    
    // MARK: - PROPERTIES
    
    static let identifier = "TitleCollectionViewCell"
    
    var titleID: Int?
    
    var viewModel: TitlesListCellViewModelProtocol! {
        didSet {
            if titleID == viewModel.titleId {
                posterImageView.image = nil
                viewModel.fetchPoster { [weak self] imageData in
                    guard let imageData = imageData else { return }
                    self?.posterImageView.image = UIImage(data: imageData)
                }
            } else {
                posterImageView.image = nil
            }
        }
    }
    
    // MARK: - VIEW
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    // MARK: - INIT
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
}
