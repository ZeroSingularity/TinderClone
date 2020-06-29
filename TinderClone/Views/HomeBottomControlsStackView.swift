//
//  HomeBottomControlsStackView.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 6/29/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let buttonSubViews = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        buttonSubViews.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
