//
//  TopNavigationStackView.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 6/29/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

class TopNavigationStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalCentering
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        let buttons = [#imageLiteral(resourceName: "top_left_profile"), #imageLiteral(resourceName: "app_icon"), #imageLiteral(resourceName: "top_right_messages")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        buttons.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
