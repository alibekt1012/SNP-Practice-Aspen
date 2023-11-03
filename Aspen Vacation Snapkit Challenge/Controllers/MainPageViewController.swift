//
//  MainPageViewController.swift
//  Aspen Vacation Snapkit Challenge
//
//  Created by Almat Alibekov on 01.11.2023.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    // - MARK: - Data
    var locations = [Location(name: "Alley Palace", image: "first", rating: 5), Location(name: "Coeurdes Alpes", image: "second", rating: 4), Location(name: "Aspen", image: "first", rating: 5), Location(name: "Shymbulak", image: "second", rating: 4), Location(name: "Aspen", image: "first", rating: 5), Location(name: "Shymbulak", image: "second", rating: 4), Location(name: "Aspen", image: "first", rating: 5), Location(name: "Shymbulak", image: "second", rating: 4)]
    
    var filterOptions = ["Location", "Hotels", "Food", "Adventure"]
    
    // - MARK: - Outlets
    var exploreLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Explore"
        label.font = UIFont(name: "Montserrat", size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
        
    }()
    
    var titleLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Aspen"
        label.font = UIFont(name: "Montserrat", size: 32)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
        
    }()
    
    var searchBar: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Find things to do"
        textField.font = UIFont(name: "Montserrat", size: 13)
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(named: "searchIcon"))
        textField.leftView?.contentMode = .scaleAspectFit
        textField.layer.cornerRadius = 24
        textField.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 1, alpha: 1)
        return textField
        
        
    }()
    
    lazy var collectionView: UICollectionView = {
       
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 28)
        layout.itemSize = CGSize(width: 188, height: 240)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    lazy var filterCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 89, height: 41)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()

    // - MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        self.title = "Main page"
        view.backgroundColor = .white
        
        setupViews()
        setupConstraits()
        
    }
    
    // - MARK: - Views
    func setupViews() {
        view.addSubview(exploreLabel)
        view.addSubview(titleLabel)
        view.addSubview(filterCollectionView)
        view.addSubview(collectionView)
        view.addSubview(searchBar)
    }
    
    // - MARK: - Constraints
    func setupConstraits() {
        
        exploreLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(exploreLabel.snp.bottom)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.trailing.equalTo(-20)
            make.height.equalTo(52)
        }

        filterCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(32)
            make.height.equalTo(42)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(filterCollectionView.snp.bottom).offset(32)
            make.height.equalTo(300)
        }
       
    }
    
    
    // - MARK:  Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == filterCollectionView {
            return filterOptions.count
        }
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        if collectionView == filterCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FilterCollectionViewCell {
                cell.setupData(options: filterOptions[indexPath.item])
                return cell
            }
            fatalError("Unable to deque cell")
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LocationCollectionViewCell {
            cell.setupCell(location: locations[indexPath.item])
            return cell
        }
        fatalError("Unable to deque cell")
       
    }
    
}
