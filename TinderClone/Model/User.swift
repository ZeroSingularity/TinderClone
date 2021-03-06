//
//  User.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 6/30/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

struct User: ProducesCardViewModel {
    let name: String,
        age: Int,
        profession: String,
        imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        
        return CardViewModel(imageNames: imageNames, attributedString: attributedText, textAlignment: .left)
    }
}
