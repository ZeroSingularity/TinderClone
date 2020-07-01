//
//  CardView.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 6/29/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

class CardView: UIView {
    var cardViewModel: CardViewModel! {
        didSet {
            imageView.image = UIImage(named: cardViewModel.imageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment = cardViewModel.textAlignment
        }
    }
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
    fileprivate let informationLabel = UILabel()
    
    // Configurations
    fileprivate let threshold: CGFloat = 160
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLabel.text = "Test Name, Test Name Age"
        informationLabel.textColor = .white
        informationLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        informationLabel.numberOfLines = 2
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 100
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        // determine dismiss card or not
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                //                            self.frame = CGRect(x: 0,
                //                                                y: 0,
                //                                                width: self.frame.width,
                //                                                height: self.frame.height)
                self.center = CGPoint(x: 600 * translationDirection, y: 0)
            } else {
                self.transform = .identity
            }
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
                //            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
