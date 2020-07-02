//
//  CardViewModel.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 6/30/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

class CardViewModel {
    let imageNames: [String],
    attributedString: NSAttributedString,
    textAlignment: NSTextAlignment
    var imageIndexObserver: ((UIImage?, Int) -> ())?
    
    init(imageNames: [String], attributedString: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributedString = attributedString
        self.textAlignment = textAlignment
    }
    
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named: imageName)
            imageIndexObserver?(image, imageIndex)
        }
    }
    
    func goToNextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }
    
    func goToPreviousPhoto() {
        imageIndex = max(0, imageIndex - 1)
    }
}
