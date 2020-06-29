//
//  ContentView.swift
//  TinderClone
//
//  Created by Jacobo Hernandez on 5/6/20.
//  Copyright © 2020 Jacobo Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topStackView = TopNavigationStackView()
    let blueView = UIView()
    let buttonStackView = HomeBottomControlsStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        blueView.backgroundColor = .blue
        
        setupLayout()
    }
    
    // MARK:- FilePrivate
    
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, blueView, buttonStackView])
        overallStackView.axis = .vertical
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        view.addSubview(overallStackView)
    }
}
