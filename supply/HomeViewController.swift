//
//  FirstViewController.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{
    var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    var categoryView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        stackView.distribution = .fillEqually
//        let button1 = UIButton()
//        button1.layer.cornerRadius = 10
//        button1.setImage(UIImage(named:"outline-medical"), for: .normal)
//        button1.contentMode = .center
//        button1.imageView?.contentMode = .scaleAspectFit
//        button1.backgroundColor = .red
//        let button2 = UIButton()
//        button2.layer.cornerRadius = 10
//        button2.backgroundColor = .red
//        button2.layer.cornerRadius = 10
//        button2.setImage(UIImage(named:"hands"), for: .normal)
//        button2.contentMode = .center
//        button2.imageView?.contentMode = .scaleAspectFit
//        button2.backgroundColor = .red
//        let button3 = UIButton()
//        button3.layer.cornerRadius = 10
//        button3.backgroundColor = .red
//        button3.layer.cornerRadius = 10
//        button3.setImage(UIImage(named:"water"), for: .normal)
//        button3.contentMode = .center
//        button3.imageView?.contentMode = .scaleAspectFit
//        button3.backgroundColor = .red
//        let button4 = UIButton()
//        button4.layer.cornerRadius = 10
//        button4.backgroundColor = .red
//        button4.layer.cornerRadius = 10
//        button4.setImage(UIImage(named:"shirt"), for: .normal)
//        button4.contentMode = .center
//        button4.imageView?.contentMode = .scaleAspectFit
//        button4.backgroundColor = .red
//        let button5 = UIButton()
//        button5.layer.cornerRadius = 10
//        button5.backgroundColor = .red
//        button5.layer.cornerRadius = 10
//        button5.setImage(UIImage(named:"food"), for: .normal)
//        button5.contentMode = .center
//        button5.imageView?.contentMode = .scaleAspectFit
//        button5.backgroundColor = .red
        
        
        return stackView
    }()
    
    func makeButton(backgroundColor: UIColor, name:String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = backgroundColor
        button.tintColor = .black
        
        button.setImage(UIImage(named:name)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    
    
    
    var toggleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245)
        return cv
    }()
   
    let sub: UIView = {
        let view = UIView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.rgb(red: 223, green: 223, blue: 223)
        self.title = "Supply"
        
       
        sub.backgroundColor = .white
        sub.layer.cornerRadius = 15
        sub.addSubview(categoryView)
        sub.addSubview(searchBar)
        sub.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: categoryView)
        sub.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: searchBar)
        sub.addConstraintsWithFormat(format: "V:|-10-[v0]-20-[v1]-|", views: categoryView, searchBar)
        self.view.addSubview(sub)
        sub.anchor(top: self.topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 140)
          setupMenuBar()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 223, green: 223, blue: 223)
    
        setupCollection()
        setupStack()

    }
    func setupStack() {
        let button1 = makeButton(backgroundColor: UIColor.rgb(red: 255, green: 99, blue: 99), name: "medical")
        let button2 = makeButton(backgroundColor: UIColor.rgb(red: 203, green: 255, blue: 194), name: "hands")
        let button3 = makeButton(backgroundColor: UIColor.rgb(red: 165, green: 239, blue: 255), name: "water")
        let button4 = makeButton(backgroundColor: UIColor.rgb(red: 255, green: 205, blue: 241), name: "food")
        let button5 = makeButton(backgroundColor: UIColor.rgb(red: 253, green: 255, blue: 140), name: "shirt")
        categoryView.addArrangedSubview(button1)
        categoryView.addArrangedSubview(button2)
        
        categoryView.addArrangedSubview(button3)
        categoryView.addArrangedSubview(button4)
        categoryView.addArrangedSubview(button5)
        
        
    }
    
    
    
    func setupCollection() {
        self.view.addSubview(toggleCollectionView)
        toggleCollectionView.anchor(top: menuBar.bottomAnchor , left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        toggleCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: "myCell")
        toggleCollectionView.delegate = self
        toggleCollectionView.dataSource = self
    }
    
    
    
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        
        
        view.addSubview(menuBar)
        menuBar.anchor(top: sub.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft:50, paddingBottom: 0, paddingRight:-50, width: 0, height: 50)
        
       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        menuBar.horizontalBarLeftAnchorConstraint?.constant = abs(scrollView.contentOffset.x) / 2.7
        
        
    
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
       
    }
    
    
    func setupSegment() {
        
       
        
    }
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        toggleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
       
    }
    

}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! FeedCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height:collectionView.frame.height)
    }
    
    
    
}
