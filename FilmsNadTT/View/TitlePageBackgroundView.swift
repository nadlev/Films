//
//  TitlePageBackgroundView.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 2/3/23.
//

import UIKit

class TitlePageBackgroundView: UIView {

    private lazy var backgroundShadowGradient = CAGradientLayer.posterShadow()

    // MARK: - VIEW
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.opacity = 0.35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        backgroundImageView.layer.addSublayer(backgroundShadowGradient)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented" )
    }
    
    //MARK: - LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImageView.frame = bounds
        backgroundShadowGradient.frame = backgroundImageView.bounds
    }
    
    // MARK: - METHODS
    
    func setImage(_ image: UIImage?) {
        backgroundImageView.image = image
    }
}
