//
//  Advertiser.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 7/1/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

struct Advertiser: ProducesCardViewModel {
    let title: String,
    brandName: String,
    posterPhotoName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font : UIFont.systemFont(ofSize: 34, weight: .heavy)])
        attributedString.append(NSMutableAttributedString(string: "\n\(brandName)", attributes: [.font : UIFont.systemFont(ofSize: 24, weight: .bold)]))
        return CardViewModel(imageNames: [posterPhotoName], attributedString: attributedString, textAlignment: .center)
    }
}
