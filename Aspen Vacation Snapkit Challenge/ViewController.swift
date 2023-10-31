//
//  ViewController.swift
//  Aspen Vacation Snapkit Challenge
//
//  Created by Almat Alibekov on 31.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // UI elements
    
    var titleAspen: UILabel = {
        var label = UILabel()
        label.text = "Aspen"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Hiatus", size: 116)
        return label
    }()
    
    var subTitle1: UILabel = {
        var label = UILabel()
        label.text = "Plan your"
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 30)
        return label
    }()
    
    var subTitle2: UILabel = {
        var label = UILabel()
        label.text = "Luxurious Vacation"
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 50)
        label.numberOfLines = 0
        return label
    }()
    
    var background: UIImageView = {
       
        var image = UIImageView()
        image.image = UIImage(named: "aspen_bc")
        return image
        
    }()
    
    var exploreButton: UIButton = {
       
        var button = UIButton()
        button.setTitle("Explore", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 16)
        button.backgroundColor = UIColor(red: 0.10, green: 0.43, blue: 0.93, alpha: 1.00)
        button.layer.cornerRadius = 16
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    // Setup Views
    
    func setupViews() {
        view.addSubview(background)
        view.addSubview(titleAspen)
        view.addSubview(subTitle1)
        view.addSubview(subTitle2)
        view.addSubview(exploreButton)
        
    }
    
    // Setup Constraints
    func setupConstraints() {
        background.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        titleAspen.snp.makeConstraints { make in
            make.top.equalTo(93)
            make.leading.equalTo(57)
            make.trailing.equalTo(-55)
        }
        
        subTitle1.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.bottom.equalTo(subTitle2.snp.top).offset(-8)
        }
        
        subTitle2.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.trailing.equalTo(-48)
            make.bottom.equalTo(exploreButton.snp.top).offset(-24)
        }
        
        exploreButton.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.height.equalTo(52)
            make.trailing.equalTo(-32)
            make.bottom.equalTo(-48)
        }
    }


}

