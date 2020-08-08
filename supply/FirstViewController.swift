//
//  FirstViewController.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    var collection: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(addButton)
        
        addButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 300, paddingLeft: 0, paddingBottom: -300, paddingRight: 0, width: 0, height: 0)

    }

}









