//
//  ItemCell.swift
//  supply
//
//  Created by Joseph Yeh on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit




class ItemCell: BaseCell {
    
    var itemLabel : UILabel = {
        let label = UILabel()
        label.text = "Masks"
        label.textColor = .black
    
        return label
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Chico, Ca"
        label.textColor = .gray
        return label
    }()
    
    var profile : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"profile"), for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.text = "Joseph Yeh"
        return label
    }()
    
    var nameDes : UILabel = {
        let label = UILabel()
        label.text = "Healthcare Partner"
        return label
    }()
    
    var itemDescription: UILabel = {
        let label = UILabel()
        label.text = "aksjdbalskdbkhajsndabkjsdlnabksdnljkakbsjdlnkakbsdnlakbsdnlaknsdlakhsbd"
        return label
    }()
    
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .red
        self.addSubview(itemLabel)
        self.addSubview(locationLabel)
        self.addSubview(profile)
        self.addSubview(name)
        self.addSubview(nameDes)
        self.addSubview(stack)
        self.addSubview(itemDescription)
        stack.addArrangedSubview(profile)
        let sv2 = UIStackView()
        profile.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sv2.alignment = .fill
        sv2.distribution = .fill
        sv2.addArrangedSubview(name)
        sv2.addArrangedSubview(nameDes)
        stack.addArrangedSubview(sv2)
        
        itemLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft:20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        locationLabel.anchor(top: itemLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        stack.anchor(top: locationLabel.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
       
        
        
        
        
        
        
        
        
        
        self.layer.cornerRadius = 15
    }
    
    
    
    
    
    
    
    
    
    
}


