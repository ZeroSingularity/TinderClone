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

struct CardViewModel {
    let imageName: String,
    attributedString: NSAttributedString,
    textAlignment: NSTextAlignment
}
